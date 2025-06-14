#!/usr/bin/env bash

# Sensor info
echo "Available sensors:" > /tmp/dwmblocks_debug.log
sensors >> /tmp/dwmblocks_debug.log
echo "---" >> /tmp/dwmblocks_debug.log


CPU_TEMP=$(sensors | awk '
    /^Tdie|^Package id|^Core 0|^CPU|^temp1/ {
        gsub(/[+°C]/, "");
        for (i=1; i<=NF; i++) {
            if ($i ~ /^[0-9]+(\.[0-9]+)?$/) {
		gsub(/\..*/, "", $i);
                print $i;
                exit;
            }
        }
    }')

# Debug CPU temperature detection, if not found, return N/A
if [ -z "$CPU_TEMP" ]; then
    # Try simpler pattern as fallback
    CPU_TEMP=$(sensors | grep -E '^(Core 0|Package id 0|CPU)' | awk '{print $3}' | tr -d '+°C' | head -n1)
fi

[ -z "$CPU_TEMP" ] && CPU_TEMP="N/A"
echo "CPU_TEMP=$CPU_TEMP" >> /tmp/dwmblocks_debug.log


# Try different GPU temperature sensors (AMD and NVIDIA), if not found, return N/A
if command -v nvidia-smi >/dev/null 2>&1; then
    # NVIDIA GPU
    GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
else
    # AMD GPU
    GPU_TEMP=$(sensors | awk '/^edge|^junction/ {gsub(/\+/,""); gsub(/\..*/,"",$2); print $2}')
fi

[ -z "$GPU_TEMP" ] && GPU_TEMP="N/A"


# Try different fan sensors
FAN_SPEED=$(sensors | awk '/^fan|^cpu_fan/ {print $2" "$3}')
[ -z "$FAN_SPEED" ] && FAN_SPEED="N/A"


# Memory and CPU usage
MEM_USE=$(free -m | awk '/^Mem/ {printf "%.1f", ($3)/1024}')
CPU_USE=$(iostat -c | awk '/avg-cpu:/{getline; print "User CPU: "$1"%\n\nSystem CPU: "$3"%"}')


# Show warning icon if CPU or GPU temp are high
case $CPU_TEMP in
    "N/A") COLOR="#d8dee9" && CPU_ICON="󰍛 ?" ;;
    [7-9][6-9]|[8-9][0-9]|100) COLOR="#bf616a" && CPU_ICON="" ;;  # Greater than 75
    [6][6-9]|7[0-5]) COLOR="#ebcb8b" && CPU_ICON="󰍛" ;;            # Between 66 and 75
    *) COLOR="#a3be8c" && CPU_ICON="󰍛" ;;                          # 65 or below
esac

case $GPU_TEMP in
    "N/A") GPU_ICON="󰢮 ?" ;;
    [7-9][1-9]|[8-9][0-9]|100) GPU_ICON="" ;;  # Greater than 71
    [5][1-9]|70) GPU_ICON="󰢮" ;;                # Between 51 and 70
    *) GPU_ICON="󰢮" ;;                          # 50 or below
esac


# Send to bar
echo " $GPU_ICON $GPU_TEMP°C  $CPU_ICON $CPU_TEMP°C   ${MEM_USE}g"


# Clicking on bar
case $BLOCK_BUTTON in
		1) setsid -w -f "$TERMINAL" -e htop ;;
		3) notify-send -t 10000 -h string:bgcolor:$COLOR Stats "$CPU_USE\n\nGPU: $GPU_TEMP°C\n\nFan Speed: $FAN_SPEED" ;;
		6) setsid -f "$TERMINAL" -e "$EDITOR" "$0" ;;
esac
