#!/usr/bin/env bash
pactl set-sink-mute @DEFAULT_SINK@ toggle
pkill -RTMIN+10 dwmblocks 