#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM-UDRC"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/MMDVM-UDRC
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVM-UDRC is Up-to-Date"
	notify-send 'UPDATE' 'MMDVM-UDRC is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping MMDVM-UDRC ====="
	notify-send 'UPDATEt' 'Stopping MMDVM-UDRC' --icon=dialog-information 
	pkill -f /home/pi/Applications/MMDVM-UDRC/MMDVM
	sleep 2
	echo "[UPDATE][$(date)] ===== Updating MMDVM-UDRC from Repository ====="
	notify-send 'UPDATE' 'Updating MMDVM-UDRC from Repository' --icon=dialog-information 
	git pull
	make clean
	make
	sleep 2
	echo "[UPDATE][$(date)] ===== MMDVM-UDRC Update Successful ====="
	notify-send 'UPDATE' 'MMDVM-UDRC Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVM-UDRC Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVM-UDRC Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
