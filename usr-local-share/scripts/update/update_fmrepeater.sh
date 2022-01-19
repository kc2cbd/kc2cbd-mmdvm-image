#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="FMRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/FMRepeater
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] FMRepeater is Up-to-Date"
	notify-send 'UPDATE' 'FMRepeater is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping FMRepeater ====="
	notify-send 'UPDATEt' 'Stopping FMRepeater' --icon=dialog-information 
	pkill -f /usr/local/bin/FMRepeater
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating FMRepeater from Repository ====="
	notify-send 'UPDATE' 'Updating FMRepeater from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo install -m 755 FMRepeater /usr/local/bin/
	sleep 2
	echo "[UPDATE][$(date)] ===== FMRepeater Update Successful ====="
	notify-send 'UPDATE' 'FMRepeater Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with FMRepeater Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with FMRepeater Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
