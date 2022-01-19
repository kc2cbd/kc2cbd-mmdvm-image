#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="YSFClients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping YSFClients ====="
notify-send 'REBUILD' 'Stopping YSFClients' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/YSFClients
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding YSFClients from Repository ====="
notify-send 'REBUILD' 'Rebuilding YSFClients from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/YSFClients
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== YSFClients Rebuilt Successfully ====="
notify-send 'REBUILD' 'YSFClients Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
