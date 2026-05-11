#!/bin/bash
sleep 5

export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $USER xfce4-session)/environ | tr '\0' '\n' | grep DBUS | cut -d= -f2-)

for p in $(/usr/bin/xfconf-query -c xfce4-desktop -l | grep image-path); do
    /usr/bin/xfconf-query -c xfce4-desktop -p "$p" -s /usr/share/wallpapers/debami.jpg
done

/usr/bin/xfconf-query -c xsettings -p /Net/IconThemeName -s Ars-Light-Icons