#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/MMDVM
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVM is Up-to-Date"
	notify-send 'UPDATE' 'MMDVM is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Updating MMDVM From Repository ====="
	notify-send 'UPDATE' 'Updating MMDVM From Repository' --icon=dialog-information 
	git pull
	echo "[UPDATE][$(date)] !!!!! Make Sure You Run The Arudino IDE to Update Your DUE !!!!!"
	notify-send 'UPDATE' 'Run The Ardunio IDE to Update Your Due' --icon=dialog-error --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVM Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with MMDVM Update !!!!!' --icon=dialog-error --urgency=critical

fi

sleep 10

exit
