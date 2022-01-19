#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="FMRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping FMRepeater ====="
notify-send 'REBUILD' 'Stopping FMRepeater' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/FMRepeater
sleep 5
echo "[REBUILD][$(date)] ===== Rebuilding FMRepeater from Repository ====="
notify-send 'REBUILD' 'Rebuilding FMRepeater from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/FMRepeater
git fetch --all
git reset --hard origin/master
make clean
make
sudo install -m 755 FMRepeater /usr/local/bin/
sleep 5
echo "[REBUILD][$(date)] ===== FMRepeater Rebuilt Successfully ====="
notify-send 'REBUILD' 'FMRepeater Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
