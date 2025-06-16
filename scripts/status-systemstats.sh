#!/usr/bin/env bash

# Check if the battery files exist
if [ -f /sys/class/power_supply/BAT0/capacity ] && [ -f /sys/class/power_supply/BAT0/status ]; then
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    BAT_INFO="BAT: $BAT% $STATUS"
else
    BAT_INFO=""
fi

# CPU
CPU=$(
    awk -v FS='[ ]+' '/^cpu / { 
    total = $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9
    idle = $5
    usage = 100 * (1 - (idle / total))
    printf("CPU: %.1f%%", usage)
}' /proc/stat
)

# RAM
RAM=$(free -h | awk '/^Mem:/ { print "RAM: "$3 "/" $2 }')

# Output the result, omitting BAT_INFO if not available
echo "$BAT_INFO | $CPU | $RAM"

