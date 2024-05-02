#!/bin/sh

export XAUTHORITY=/home/{USERNAME}/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export XDG_RUNTIME_DIR="/run/user/1000"

if pactl list | grep "available: yes" | grep hdmi
    then
    echo "HDMI disconnected"
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo
else
    echo "HDMI connected"
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo+input:analog-stereo
fi
