#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="P25Clients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping P25Clients ====="
notify-send 'REBUILD' 'Stopping P25Clients' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/P25Clients
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding P25Clients from Repository ====="
notify-send 'REBUILD' 'Rebuilding P25Clients from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/P25Clients
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== P25Clients Rebuilt Successfully ====="
notify-send 'REBUILD' 'P25Clients Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
