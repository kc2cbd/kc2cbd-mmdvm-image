#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_HS"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/MMDVM_HS
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVM_HS is Up-to-Date"
	notify-send 'UPDATE' 'MMDVM_HS is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Updating MMDVM_HS From Repository ====="
	notify-send 'UPDATE' 'Updating MMDVM_HS From Repository' --icon=dialog-information 
	git pull
	echo "[UPDATE][$(date)] !!!!! Make Sure You edit the Confg.h and update your Device !!!!!"
	notify-send 'UPDATE' 'Make Sure You edit the Confg.h and update your Device' --icon=dialog-error --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVM_HS Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with MMDVM_HS Update !!!!!' --icon=dialog-error --urgency=critical

fi

sleep 10

exit
