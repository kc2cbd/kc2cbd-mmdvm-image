#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMRGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping DMRGateway ====="
notify-send 'REBUILD' 'Stopping DAPNETGateway' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/DMRGateway
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding DMRGateway from Repository ====="
notify-send 'REBUILD' 'Rebuilding DMRGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DMRGateway
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== DMRGateway Rebuilt Successfully ====="
notify-send 'REBUILD' 'DMRGateway Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
