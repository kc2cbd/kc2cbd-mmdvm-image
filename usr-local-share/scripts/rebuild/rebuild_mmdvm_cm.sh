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

echo "[REBUILD][$(date)] ===== Stopping MMDVM_CM ====="
notify-send 'REBUILD' 'Stopping MMDVM_CM' --icon=dialog-information --urgency=critical
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
echo "[REBUILD][$(date)] ===== Rebuilding MMDVM_CM from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVM_CM from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVM_CM
git fetch --all
git reset --hard origin/master
sed -i 's+SUBDIRS = DMR2NXDN DMR2YSF NXDN2DMR YSF2DMR YSF2NXDN YSF2P25+SUBDIRS = DMR2M17 DMR2NXDN DMR2P25 DMR2YSF M172DMR NXDN2DMR P252DMR USRP2DMR USRP2M17 USRP2P25 YSF2DMR YSF2NXDN YSF2P25+g' Makefile
make clean
make
sudo make install
sleep 5
echo "[REBUILD][$(date)] ===== MMDVM_CM Rebuilt Successfully ====="
notify-send 'REBUILD' 'MMDVM_CM Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
