#!/bin/sh

export XAUTHORITY=/home/{USERNAME}/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export XDG_RUNTIME_DIR="/run/user/1000"

# Wait for Udev worker to finish processing all events
sleep 3

# HDMI AC3 profiles are available when HDMI is disconnected
if pactl list | grep "available: yes" | grep hdmi | grep AC3 -v
    then
    echo "HDMI connected"
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo+input:analog-stereo
else
    echo "HDMI disconnected"
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo
fi
