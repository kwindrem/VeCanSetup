#!/bin/sh

# called from udev remove action to stop a slcand process no longer needed
#
# $1 is the device (e.g., can10) to be killed
#
# slcand will not quit when the device is unplugged so it is necessary to
#	kill the related processes
#
# pkill could be used if avaialble but prior to v2.90~26 it is not included in the build

pgrep -f "slcand .*$1" | xargs -r kill
