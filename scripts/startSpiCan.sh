#!/bin/sh

# called from udev ADD action to bring up the related link
#  
#
# $1 is the device (e.g., can10)
#
# these actions are only required prior to v2.90~18

if [ ! -f "/etc/venus/newUdevRules" ] ; then
	# restart services so they see this new interface
	svc -t /service/vecan-dbus.$1
	svc -t /service/can-bus-bms.$1
	svc -t /service/mqtt-n2k.$1
fi
