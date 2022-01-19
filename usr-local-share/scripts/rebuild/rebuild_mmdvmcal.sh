#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMCal"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Rebuilding MMDVMCal from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVMCal from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVMCal
git fetch --all
git reset --hard origin/master
make clean
make
sudo make uninstall
sudo make install
echo "[REBUILD][$(date)] ===== MMDVMCal Rebuilt Successfully ====="
notify-send 'REBUILD' 'MMDVMCal Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
