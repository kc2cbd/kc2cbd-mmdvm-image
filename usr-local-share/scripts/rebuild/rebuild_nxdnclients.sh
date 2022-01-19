#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="NXDNClients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping NXDNClients ====="
notify-send 'REBUILD' 'Stopping NXDNClients' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/NXDNClients
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding NXDNClients from Repository ====="
notify-send 'REBUILD' 'Rebuilding NXDNClients from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/NXDNClients
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== NXDNClients Rebuilt Successfully ====="
notify-send 'REBUILD' 'NXDNClients Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
