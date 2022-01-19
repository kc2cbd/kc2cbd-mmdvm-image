#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Client"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/M17Client
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] M17Client is Up-to-Date"
	notify-send 'UPDATE' 'M17Client is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping M17Client ====="
	notify-send 'UPDATEt' 'Stopping M17Client' --icon=dialog-information 
	pkill -f /usr/local/bin/M17Client
	sleep 5
	echo "[UPDATE][$(date)] ===== Updating M17Client from Repository ====="
	notify-send 'UPDATE' 'Updating M17Client from Repository' --icon=dialog-information 
	git pull
	cd /home/pi/Applications/M17Client/Daemon
	make clean
	make
	sudo make install
	cd /home/pi/Applications/M17Client/GUI
	sed -i 's+export BINDIR  := /usr/bin+export BINDIR  := /usr/local/bin+g' Makefile
	make clean
	make
	sudo make install
	cd /home/pi/Applications/M17Client/TS
	make clean
	make
	sudo make install
	sleep 5
	echo "[UPDATE][$(date)] ===== M17Client Update Successful ====="
	notify-send 'UPDATE' 'M17Client Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with M17Client Update !!!!!"
	notify-send 'UPDATE' '!!!!! Error with M17Client Update !!!!!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
