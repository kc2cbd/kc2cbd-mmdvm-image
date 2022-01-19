#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="APRSGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/APRSGateway
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] APRSGateway is Up-to-Date"
	notify-send 'UPDATE' 'APRSGateway is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping APRSGateway ====="
	notify-send 'UPDATEt' 'Stopping APRSGateway' --icon=dialog-information
	pkill -f /usr/local/bin/APRSGateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating APRSGateway from Repository ====="
	notify-send 'UPDATE' 'Updating APRSGateway from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== APRSGateway Update Successful ====="
	notify-send 'UPDATE' 'APRSGateway Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with APRSGateway Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with APRSGateway Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
