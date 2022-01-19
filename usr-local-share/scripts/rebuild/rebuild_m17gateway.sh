#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Gateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping M17Gateway ====="
notify-send 'REBUILD' 'Stopping M17Gateway' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/M17Gateway
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding M17Gateway from Repository ====="
notify-send 'REBUILD' 'Rebuilding M17Gateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/M17Gateway
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== M17Gateway Rebuilt Successfully ====="
notify-send 'REBUILD' 'M17Gateway Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
