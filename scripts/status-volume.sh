#!/usr/bin/env bash
pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1 | sed 's/%//' | awk '{printf("VOL: %s%%", $1)}' 