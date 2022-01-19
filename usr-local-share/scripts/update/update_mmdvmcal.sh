#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMCal"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/MMDVMCal
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVMCal is Up-to-Date"
	notify-send 'UPDATE' 'MMDVMCal is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Updating MMDVMCal from Repository ====="
	notify-send 'UPDATE' 'Updating MMDVMCal from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	echo "[UPDATE][$(date)] ===== MMDVMCal Update Successful ====="
	notify-send 'UPDATE' 'MMDVMCal Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVMCal Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVMCal Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
