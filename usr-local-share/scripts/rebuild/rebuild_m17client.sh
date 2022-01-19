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

echo "[REBUILD][$(date)] ===== Stopping M17Client ====="
notify-send 'REBUILD' 'Stopping M17Client' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/M17Client
sleep 5
echo "[REBUILD][$(date)] ===== Rebuilding M17Client from Repository ====="
notify-send 'REBUILD' 'Rebuilding M17Client from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/M17Client/Daemon
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
cd /home/pi/Applications/M17Client/GUI
sed -i 's+export BINDIR  := /usr/bin+export BINDIR  := /usr/local/bin+g' Makefile
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
cd /home/pi/Applications/M17Client/TS
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 5
echo "[REBUILD][$(date)] ===== M17Client Rebuilt Successfully ====="
notify-send 'REBUILD' 'M17Client Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
