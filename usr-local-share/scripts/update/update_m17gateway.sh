#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Gateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/M17Gateway
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] M17Gateway is Up-to-Date"
	notify-send 'UPDATE' 'M17Gateway is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping M17Gateway ====="
	notify-send 'UPDATEt' 'Stopping M17Gateway' --icon=dialog-information 
	pkill -f /usr/local/bin/M17Gateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating M17Gateway from Repository ====="
	notify-send 'UPDATE' 'Updating M17Gateway from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== M17Gateway Update Successful ====="
	notify-send 'UPDATE' 'M17Gateway Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with M17Gateway Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with M17Gateway Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
