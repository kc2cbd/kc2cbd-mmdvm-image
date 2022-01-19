#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="NXDNClients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/NXDNClients
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] NXDNClients is Up-to-Date"
	notify-send 'UPDATE' 'NXDNClients is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping NXDNClients ====="
	notify-send 'UPDATEt' 'Stopping NXDNClients' --icon=dialog-information 
	pkill -f /usr/local/bin/NXDNGateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating NXDNClients from Repository ====="
	notify-send 'UPDATE' 'Updating NXDNClients from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== NXDNClients Update Successful ====="
	notify-send 'UPDATE' 'NXDNClients Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with NXDNClients Update !!!!!"
	notify-send 'UPDATE' 'Error with NXDNClients Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
