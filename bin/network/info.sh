#!/bin/bash

echo "********** System Information **********"
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo "User: $(whoami)"
echo ""

echo "********** Network Information **********"
# Display IP addresses
echo "IP Addresses:"
ip -4 addr show | grep inet | awk '{print $2}'
echo ""

# Display default gateway
echo "Default Gateway:"
ip route | grep default | awk '{print $3}'
echo ""

# Display DNS servers
echo "DNS Servers:"
cat /etc/resolv.conf | grep nameserver | awk '{print $2}'
echo ""

# Display network interfaces and status
echo "Network Interfaces:"
ip link show | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2}'
echo ""

# Display Wi-Fi SSID (if connected)
if command -v iwconfig &> /dev/null; then
    echo "Wi-Fi SSID:"
    iwconfig 2>/dev/null | grep ESSID | awk -F: '{print $2}' | sed 's/"//g'
    echo ""
fi

# Display active connections
echo "Active Network Connections:"
netstat -ant | grep ESTABLISHED
echo ""

# Display network usage
echo "Network Usage (RX/TX):"
ifstat -T 1 1 | awk 'NR==3'
echo ""

echo "********** Other Useful Information **********"
# Disk usage
echo "Disk Usage:"
df -h | grep '^/dev/' | awk '{print $1 ": " $5 " used (" $3 "/" $2 ")"}'
echo ""

# Memory usage
echo "Memory Usage:"
free -h | awk 'NR==2{print "Used: " $3 " / " $2}'
echo ""

# CPU load
echo "CPU Load:"
top -bn1 | grep "load average:" | awk '{print $10 $11 $12}'
echo ""
