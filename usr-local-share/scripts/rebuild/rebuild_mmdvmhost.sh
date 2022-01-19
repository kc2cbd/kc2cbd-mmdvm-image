#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMHost"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping MMDVMHost ====="
notify-send 'REBUILD' 'Stopping MMDVMHost' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/MMDVMHost
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding MMDVMHost from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVMHost from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVMHost
git fetch --all
git reset --hard origin/master
make clean
make
sudo make install
sleep 2
echo "[REBUILD][$(date)] ===== MMDVMHost Rebuilt Successfully ====="
notify-send 'REBUILD' 'MMDVMHost Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
