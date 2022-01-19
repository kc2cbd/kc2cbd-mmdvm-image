#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="APRSGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping APRSGateway ====="
notify-send 'REBUILD' 'Stopping APRSGateway' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/APRSGateway
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding APRSGateway from Repository ====="
notify-send 'REBUILD' 'Rebuilding APRSGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/APRSGateway
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== APRSGateway Rebuilt Successfully ====="
notify-send 'REBUILD' 'APRSGateway Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
