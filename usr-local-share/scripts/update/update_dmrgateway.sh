#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMRGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/DMRGateway
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] DMRGateway is Up-to-Date"
	notify-send 'UPDATE' 'DMRGateway is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping DMRGateway ====="
	notify-send 'UPDATEt' 'Stopping DMRGateway' --icon=dialog-information 
	pkill -f /usr/local/bin/DMRGateway
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating DMRGateway from Repository ====="
	notify-send 'UPDATE' 'Updating DMRGateway from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== DMRGateway Update Successful ====="
	notify-send 'UPDATE' 'DMRGateway Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with DMRGateway Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with DMRGateway Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
