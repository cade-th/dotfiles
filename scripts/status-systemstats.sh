#!/usr/bin/env bash

# Battery status
if [ -f /sys/class/power_supply/BAT0/capacity ] && [ -f /sys/class/power_supply/BAT0/status ]; then
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    BAT_INFO="BAT: $BAT% $STATUS"
else
    BAT_INFO=""
fi

# CPU usage - improved calculation
CPU=$(
    awk -v FS='[ ]+' '/^cpu / { 
        total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9
        idle = $5
        usage = 100 * (1 - (idle / total))
        printf("CPU: %.1f%%", usage)
    }' /proc/stat
)

# RAM usage - improved calculation using available memory
RAM=$(free -h | awk '/^Mem:/ { 
    used = $3
    total = $2
    # Remove the "i" suffix from human readable format
    gsub(/i$/, "", used)
    gsub(/i$/, "", total)
    printf("RAM: %s/%s", used, total)
}')

# Disk usage for root filesystem
DISK=$(df -h / | awk 'NR==2 {print "DISK: "$3"/"$2}')

# Build output string, omitting battery if not available
if [ -n "$BAT_INFO" ]; then
    echo "$BAT_INFO | $CPU | $RAM | $DISK"
else
    echo "$CPU | $RAM | $DISK"
fi

