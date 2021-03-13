#!/bin/sh

#  CANable candlelight

# replace DEV with CAN port (e.g., can0)
# rename file to e.g., can0add.sh

# bring the link up - down first just in case it's already runing
ip link set DEV down
ip link set DEV up type can bitrate 250000

# restart services so they see this new interface
svc -t /service/vecan-dbus.DEV
svc -t /service/can-bus-bms.DEV
svc -t /service/mqtt-n2k.DEV
