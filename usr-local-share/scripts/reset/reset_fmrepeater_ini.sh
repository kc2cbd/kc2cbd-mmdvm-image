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

echo "[RESETINI][$(date)] ===== Stopping FMRepeater ====="
notify-send 'RESETINI' 'Stopping FMRepeater' --icon=dialog-information --urgency=critical
pkill -f FMRepeater
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding FMRepeater.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding FMRepeater.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/FMRepeater.ini /usr/local/etc/MMDVMConf/FMRepeater_$(date +'%F').ini
cp /home/pi/Applications/FMRepeater/FMRepeater.ini /usr/local/etc/MMDVMConf/FMRepeater.ini
sleep 5
echo "[RESETINI][$(date)] ===== FMRepeater.ini Rebuilt Successful. Remember to Edit the FMRepeater.ini ====="
notify-send 'RESETINI' 'FMRepeater.ini Rebuilt Successful. Remember to Edit the FMRepeater.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
