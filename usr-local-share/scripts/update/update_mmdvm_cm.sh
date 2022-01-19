#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_CM"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

cd /home/pi/Applications/MMDVM_CM
git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
	echo "[UPDATE][$(date)] MMDVM_CM is Up-to-Date"
	notify-send 'UPDATE' 'MMDVM_CM is Up-to-Date' --icon=dialog-information --urgency=critical
elif [ $LOCAL = $BASE ]; then
	echo "[UPDATE][$(date)] ===== Stopping MMDVM_CM ====="
	notify-send 'UPDATEt' 'Stopping MMDVM_CM' --icon=dialog-information 
	pkill -f /usr/local/bin/DMR2M17
	pkill -f /usr/local/bin/DMR2NXDN
	pkill -f /usr/local/bin/DMR2P25
	pkill -f /usr/local/bin/DMR2YSF
	pkill -f /usr/local/bin/M172DMR
	pkill -f /usr/local/bin/NXDN2DMR
	pkill -f /usr/local/bin/P252DMR
	pkill -f /usr/local/bin/USRP2DMR
	pkill -f /usr/local/bin/USRP2M17
	pkill -f /usr/local/bin/USRP2P25
	pkill -f /usr/local/bin/YSF2DMR
	pkill -f /usr/local/bin/YSF2NXDN
	pkill -f /usr/local/bin/YSF2P25
	sleep 5
	echo "[UPDATE][$(date)] ===== Updating MMDVM_CM from Repository ====="
	notify-send 'UPDATE' 'Updating MMDVM_CM from Repository' --icon=dialog-information 
	git pull
	sed -i 's+SUBDIRS = DMR2NXDN DMR2YSF NXDN2DMR YSF2DMR YSF2NXDN YSF2P25+SUBDIRS = DMR2M17 DMR2NXDN DMR2P25 DMR2YSF M172DMR NXDN2DMR P252DMR USRP2DMR USRP2M17 USRP2P25 YSF2DMR YSF2NXDN YSF2P25+g' Makefile
	make clean
	make
	sudo make install
	sleep 5
	echo "[UPDATE][$(date)] ===== MMDVM_CM Update Successful ====="
	notify-send 'UPDATE' 'MMDVM_CM Update Successful' --icon=dialog-information --urgency=critical
else
	echo "[UPDATE][$(date)] !!!!! Error with MMDVM_CM Update !!!!!"
	notify-send 'UPDATE' 'Error with MMDVM_CM Update!' --icon=dialog-error --urgency=critical
fi

sleep 10

exit
