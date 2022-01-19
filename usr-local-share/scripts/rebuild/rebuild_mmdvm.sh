#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[REBUILD][$(date)] ===== Rebuilding MMDVM from Repository ====="
notify-send 'REBUILD' 'Rebuilding MMDVM from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVM
git fetch --all
git reset --hard origin/master
echo "[REBUILD][$(date)] !!!!! Make Sure You Run The Arudino IDE to Update Your DUE !!!!!"
notify-send 'REBUILD' '!!!!! Make Sure You Run The Arudino IDE to Update Your DUE !!!!!' --icon=dialog-information --urgency=critical

sleep 10

exit
