#!/bin/bash

opts="-D" # daemon
#opts="-s" # show keys
usbdevice="/dev/input/by-id/usb-USB_KB_USB_KB-event-kbd"

../actkbd/actkbd $opts -d $usbdevice -c ./actkbd.conf

