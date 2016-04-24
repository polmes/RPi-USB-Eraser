#!/bin/bash

# Known USB device info
USB_LABEL="MESALLIS"
USB_VENDOR="0781"
USB_PRODUCT="5567"

# Requirements
	# 10-usb-eraser.rules in /etc/udev/rules.d/ with the following content:
	# KERNEL=="sd*1", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ACTION=="add", ATTRS{idVendor}=="0781", ATTRS{idProduct}=="5567", RUN+="/home/pi/git/RPi_USB_Eraser/usb_eraser.sh"

# Main
echo "[$(date)] Formatting in 10..." >> /home/pi/git/RPi_USB_Eraser/usb_eraser.log
sleep 10 # wait 10 seconds for last-moment regrets
mkdosfs -F 32 -n "MESALLIS" -I $(readlink -f /dev/disk/by-label/$USB_LABEL) 2>> /home/pi/git/RPi_USB_Eraser/usb_eraser.log
echo "[$(date)] ... and we're done." >> /home/pi/git/RPi_USB_Eraser/usb_eraser.log
