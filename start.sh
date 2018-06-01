#!/bin/bash

opts="-D" # daemon
#opts="-s" # show keys
usbdevice="/dev/input/by-id/usb-USB_KB_USB_KB-event-kbd"

if ps ax | grep -i "[a]ctkbd"; then
	echo "actkbd is already running"
	exit 1
fi

../actkbd/actkbd $opts -d $usbdevice -c ./actkbd.conf

