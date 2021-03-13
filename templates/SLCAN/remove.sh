#!/bin/sh

# Lawicel CANUSB module

# replace DEV with CAN port (e.g., can0)
# rename file to e.g., can0remove.sh

# Remove the USBCAN device
ps | grep slcand | grep DEV | awk '{print $1}' | xargs kill > /dev/null 2>&1


