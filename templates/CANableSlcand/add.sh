#!/bin/sh

# CANable USB with slcand firmware or CANtact

# replace DEV with CAN port (e.g., can0)
# rename file to e.g., can0add.sh

# Bind the USBCAN device
slcand -o -c -f -s5 /dev/$1 DEV

# bring the link up
ip link set DEV up

# restart services so they see this new interface
svc -t /service/vecan-dbus.DEV
svc -t /service/can-bus-bms.DEV
svc -t /service/mqtt-n2k.DEV
