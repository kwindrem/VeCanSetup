#!/bin/sh

# called from udev ADD action to start the related slcand process
#
# $1 is the tty device
# $2 is the device (e.g., can10)
# $3 is the Ve.Can profile
#	it is used to set the CANbus speed:
#		6 (500 Kb) for BmsOnly
#		5 (250 Kb) for anything else 
# the remaining command line parameters are passed to slcand
#	used for example for the VS Com interface:
#	startSlcan.sh tty5 can10 "bms-only" -t hw -S 3000000
#
# slcand will not quit when the device is unplugged so it is necessary to
#	kill the related processes. See stopSlcand.sh
#

if [ ! -z $3 ] && [ $3 == "bms-only" ]; then
	speed=6
else
	speed=5
fi

# Bind the device
/usr/bin/slcand -o -c -f ${@:4} -s$speed $1 $2

# these actions are only required prior to v2.90~18
if [ ! -f "/etc/venus/newUdevRules" ] ; then
	# bring the link up
	ip link set $2 down
	ip link set $2 up

	# refresh udev rules for this device
	udevadm trigger -y $2

	# restart services so they see this new interface
	svc -t /service/vecan-dbus.$2
	svc -t /service/can-bus-bms.$2
	svc -t /service/mqtt-n2k.$2
fi
