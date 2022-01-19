#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="P25Clients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/P25Clients
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] P25Clients is Up-to-Date"
	notify-send 'UPDATE' 'P25Clients is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping P25Clients ====="
	notify-send 'UPDATEt' 'Stopping P25Clients' --icon=dialog-information 
	pkill -f /usr/local/bin/P25Gateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating P25Clients from Repository ====="
	notify-send 'UPDATE' 'Updating P25Clients from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== P25Clients Update Successful ====="
	notify-send 'UPDATE' 'P25Clients Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with P25Clients Update !!!!!"
	notify-send 'UPDATE' 'Error with P25Clients Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
