#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMHost"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/MMDVMHost
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVMHost is Up-to-Date"
	notify-send 'UPDATE' 'MMDVMHost is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping MMDVMHost ====="
	notify-send 'UPDATEt' 'Stopping MMDVMHost' --icon=dialog-information 
	pkill -f /usr/local/bin/MMDVMHost
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating MMDVMHost from Repository ====="
	notify-send 'UPDATE' 'Updating MMDVMHost from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sudo make install
	sleep 2
	echo "[UPDATE][$(date)] ===== MMDVMHost Update Successful ====="
	notify-send 'UPDATE' 'MMDVMHost Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVMHost Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVMHost Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
