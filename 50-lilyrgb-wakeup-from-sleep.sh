#!/bin/sh

# Action script to enable wake after suspend by keyboard or mouse

if [ $1 = post ]
    then
    KB="$(dmesg | grep "Lily58 RGB Keyboard" | grep -o -P "usb.{0,5}" | egrep -o ".{0,3}$" | tail -1)"
    echo enabled > /sys/bus/usb/devices/${KB}/power/wakeup
fi

if [ $1 = pre ]
    then
    KB="$(dmesg | grep "Lily58 RGB Keyboard" | grep -o -P "usb.{0,5}" | egrep -o ".{0,3}$" | tail -1)"
    echo enabled > /sys/bus/usb/devices/${KB}/power/wakeup
fi

