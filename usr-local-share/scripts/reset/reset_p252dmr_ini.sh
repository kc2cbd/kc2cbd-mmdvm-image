#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="P252DMR"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping P252DMR ====="
notify-send 'RESETINI' 'Stopping P252DMR' --icon=dialog-information --urgency=critical
pkill -f P252DMR
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding P252DMR.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding P252DMR.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/P252DMR.ini /usr/local/etc/MMDVMConf/P252DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/P252DMR/P252DMR.ini /usr/local/etc/MMDVMConf/P252DMR.ini
sleep 5
echo "[RESETINI][$(date)] ===== P252DMR.ini Rebuilt Successful. Remember to Edit the P252DMR.ini ====="
notify-send 'RESETINI' 'P252DMR.ini Rebuilt Successful. Remember to Edit the P252DMR.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
