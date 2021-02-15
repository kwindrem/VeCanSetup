# Victron-VenusOs-VeCan-Port-Setup
Manages Victrion VenusOs VeCan (aka CANbus) ports

The setup script's actions are:
    Add - add (or modify) a port's configuraiton
        Configuration simply requires selecting one of the supported interfaces:
            CANable (both slcand and candelight firmware)
            Canberry Hat
            PCAN-USB (which is also the Victron's CANUSB)
            PiCan Hat
            Lawicel CANUSB and other SLCAN USB
            VScom USB-CAN+
            Waveshare Hat
    Remove a port's configuration
    Install the configured ports into the Venus file system
    Uninstall/restore all Venus files installed by this package
        leaving the system in a stock configuraiton

The script also hooks into SetupHelper's boot-time reinstall mechanism which
reinstalls Venus file system modifications after they are overwritten by a Venus OS update

Two VeCan ports are defined for these systems: can0 and can1, although
support for more could easily be added 

Setup:

Copy the entire repo from GitHub as a zip file to /data on the Venus device
then unzip it. This should populate /data/VeCanSetup with the package contents.

You must also install SetupHelper from here:

https://github.com/kwindrem/Victron-VeusOs-Setup-Helper

Once both packages are installed run setup and follow the prompts.
./setup
A reboot may be required following installation of some components, most notably device overlays.

You will need root access to the Venus device. Instructions can be found here:
https://www.victronenergy.com/live/ccgx:root_access
The root password needs to be reentered following a Venus update.
Setting up an authorization key (see documentation referenced above) will save time and avoid having to reset the root password after each update.

Note:
I have only tested this package with CANable.
The configurations for other interfaces was taken from

https://github.com/victronenergy/venus/wiki/RaspberryPi-CAN-Interfaces

and for USB interfaces, with my own exeperiences with CANable.


