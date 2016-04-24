#!/bin/bash

USB_UUID="06D4-6015"
USB_LABEL="MESALLIS"

# Main
function start_eraser {
	sleep 10 # wait 10 seconds for last-moment regrets
	# umount /dev/disk/by-label/MESALLIS # already unmounted
	mkdosfs -F 32 -n "MESALLIS" -I $RETURN_UUID 2>> usb_eraser.log

	echo "[$(date)] ... and we're done." >> usb_eraser.log
}

# Identify USB partition
RETURN_UUID=$(readlink -f /dev/disk/by-uuid/$USB_UUID)
RETURN_LABEL=$(readlink -f /dev/disk/by-label/$USB_LABEL)
if [ $RETURN_UUID = $RETURN_LABEL ]; then
	echo "[$(date)] USB_UUID and USB_LABEL match. Formatting in 10..." >> usb_eraser.log
	start_eraser
else
	echo "[$(date)] USB_UUID and USB_LABEL did not match. Stopping now." >> usb_eraser.log
fi
