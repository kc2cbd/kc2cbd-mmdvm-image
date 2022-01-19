#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DummyRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/DummyRepeater
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] DummyRepeater is Up-to-Date"
	notify-send 'UPDATE' 'DummyRepeater is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping DummyRepeater ====="
	notify-send 'UPDATEt' 'Stopping DummyRepeater' --icon=dialog-information 
	pkill -f /usr/local/bin/DummyRepeater
	sleep 5
	echo "[UPDATE][$(date)] ===== Updating DummyRepeater from Repository ====="
	notify-send 'UPDATE' 'Updating DummyRepeater from Repository' --icon=dialog-information 
	git pull
	make clean
	sed -i 's+export BINDIR  := /usr/bin+export BINDIR  := /usr/local/bin+g' MakefilePi
	make -j5
	sudo make -j5 install
	sleep 5
	echo "[UPDATE][$(date)] ===== DummyRepeater Update Successful ====="
	notify-send 'UPDATE' 'DummyRepeater Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with DummyRepeater Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with DummyRepeater Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
