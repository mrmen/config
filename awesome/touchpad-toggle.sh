#!/bin/bash
#
#
#    Thomas "Mr Men" Etcheverria
#    <tetcheve (at) gmail .com>
#
#    Created on : 24-10-2012 22:22:51
#    Time-stamp: <24-10-2012 22:31:20>
#
#    File name : /home/mrmen/.config/awesome/touchpad-toggle.sh
#    Description :
#


# pour fonctionner a besoin de ce qui suit pour marcher :
#    cd /usr/bin
#    sudo chmod a-x syndaemon
# d'après http://forum.ubuntu-fr.org/viewtopic.php?id=376223

synclient TouchpadOff=$((1-$(synclient -l | grep TouchpadOff | cut -d= -f2)))
