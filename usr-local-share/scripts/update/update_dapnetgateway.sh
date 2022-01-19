#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DAPNETGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/DAPNETGateway
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] DAPNETGateway is Up-to-Date"
	notify-send 'UPDATE' 'DAPNETGateway is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping DAPNETGateway ====="
	notify-send 'UPDATEt' 'Stopping DAPNETGateway' --icon=dialog-information 
	pkill -f /usr/local/bin/DAPNETGateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating DAPNETGateway from Repository ====="
	notify-send 'UPDATE' 'Updating DAPNETGateway from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== DAPNETGateway Update Successful ====="
	notify-send 'UPDATE' 'DAPNETGateway Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with DAPNETGateway Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with DAPNETGateway Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
