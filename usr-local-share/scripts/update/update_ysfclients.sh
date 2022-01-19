#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="YSFClients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/YSFClients
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] YSFClients is Up-to-Date"
	notify-send 'UPDATE' 'YSFClients is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping YSFClients ====="
	notify-send 'UPDATEt' 'Stopping YSFClients' --icon=dialog-information 
	pkill -f /usr/local/bin/YSFGateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating YSFClients from Repository ====="
	notify-send 'UPDATE' 'Updating YSFClients from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== YSFClients Update Successful ====="
	notify-send 'UPDATE' 'YSFClients Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with YSFClients Update !!!!!"
	notify-send 'UPDATE' 'Error with YSFClients Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
