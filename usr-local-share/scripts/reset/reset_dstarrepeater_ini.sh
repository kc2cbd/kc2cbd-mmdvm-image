#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DStarRepeater"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DStarRepeater ====="
notify-send 'RESETINI' 'Stopping DStarRepeater' --icon=dialog-information --urgency=critical
pkill -f dstarrepeaterd
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DStarRepeater.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DStarRepeater.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/dstarrepeater /usr/local/etc/MMDVMConf/DStarRepeater_$(date +'%F')
cp /home/pi/Applications/DStarRepeater/Linux/dstarrepeater_1.example /usr/local/etc/MMDVMConf/dstarrepeater
sleep 5
echo "[RESETINI][$(date)] ===== DStarRepeater.ini Rebuilt Successful. Remember to Edit the DStarRepeater.ini ====="
notify-send 'RESETINI' 'DStarRepeater.ini Rebuilt Successful. Remember to Edit the DStarRepeater.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
