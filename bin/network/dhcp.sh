#!/bin/bash

# Function to print the status with a timestamp
function print_status {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Check if dnsmasq is running
print_status "Checking if dnsmasq is running..."
if systemctl is-active --quiet dnsmasq; then
    print_status "dnsmasq is running."
else
    print_status "dnsmasq is NOT running. Please check the service."
    exit 1
fi

# Verify that the Ethernet interface enp10s0 is up and has the correct IP
print_status "Verifying Ethernet interface (enp10s0)..."
if ip a show enp10s0 | grep -q "192.168.123.124/24"; then
    print_status "Ethernet interface enp10s0 is up and has IP 192.168.123.124."
else
    print_status "Ethernet interface enp10s0 is NOT configured correctly. Please check the Netplan configuration."
    exit 1
fi

# Check the list of DHCP leases
print_status "Checking DHCP leases..."
LEASES=$(cat /var/lib/misc/dnsmasq.leases)
if [ -n "$LEASES" ]; then
    print_status "The following devices have been assigned IP addresses:"
    echo "$LEASES" | awk '{print "IP: "$3", MAC: "$2}'
else
    print_status "No DHCP leases found. Please ensure that devices are connected and requesting IP addresses."
    exit 1
fi

# Ping each device to verify connectivity
print_status "Pinging assigned IP addresses..."
echo "$LEASES" | while read -r line; do
    IP=$(echo $line | awk '{print $3}')
    ping -c 2 $IP > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        print_status "Successfully pinged $IP."
    else
        print_status "Failed to ping $IP. Please check the device."
    fi
done

print_status "Network verification complete."
