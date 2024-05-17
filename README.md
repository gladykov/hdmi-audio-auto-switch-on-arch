# hdmi-audio-auto-switch-on-arch
HDMI auto audio switch for XFCE on Endevour OS using Udev rule

Because when you connect HDMI cable you want to be able to use HDMI speakers.

When you disconnect HDMI you want to go back to laptop speakers.

But sometimes it is broken.


Requierements:
```
paru -S at
systemctl enable atd.service --now
```
because when udev rule is running, it will not update `pactl` info, so we need to schedule delayed task in background.

Stuff:

https://srobb.net/pipewire.html - does not work when sink has always same number and requieres X restart
https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/629 - with inspiration from @fefo1993 for this rule
https://wiki.archlinux.org/title/Udev#Execute_when_HDMI_cable_is_plugged_in_or_unplugged - good resource, but was not working
