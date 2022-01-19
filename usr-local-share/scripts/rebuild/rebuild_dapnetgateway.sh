#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DAPNETGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping DAPNETGateway ====="
notify-send 'REBUILD' 'Stopping DAPNETGateway' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/DAPNETGateway
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding DAPNETGateway from Repository ====="
notify-send 'REBUILD' 'Rebuilding DAPNETGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DAPNETGateway
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== DAPNETGateway Rebuilt Successfully ====="
notify-send 'REBUILD' 'DAPNETGateway Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
