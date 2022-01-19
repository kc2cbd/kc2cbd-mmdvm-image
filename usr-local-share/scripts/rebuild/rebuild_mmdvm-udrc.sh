#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM-UDRC"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Stopping MMDVM-UDRC ====="
notify-send 'REBUILD' 'Stopping MMDVM-UDRC' --icon=dialog-information --urgency=critical
pkill -f /usr/local/bin/MMDVM-UDRC
sleep 2
echo "[REBUILD][$(date)] ===== Rebuilding MMDVM-UDRC from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVM-UDRC from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVM-UDRC
git fetch --all
git reset --hard origin/master
make clean
make
sleep 2
echo "[REBUILD][$(date)] ===== MMDVM-UDRC Rebuilt Successfully ====="
notify-send 'REBUILD' 'MMDVM-UDRC Rebuilt Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
