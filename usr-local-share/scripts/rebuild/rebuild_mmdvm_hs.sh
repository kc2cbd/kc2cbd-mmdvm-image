#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_HS"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Rebuilding MMDVM_HS from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVM_HS from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVM_HS
git fetch --all
git reset --hard origin/master
echo "[REBUILD][$(date)] !!!!! Make Sure You edit the Confg.h and update your Device !!!!!"
notify-send 'REBUILD' '!!!!! Make Sure You edit the Confg.h and update your Device !!!!!' --icon=dialog-information --urgency=critical

sleep 10

exit
