#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMR2P25"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DMR2P25 ====="
notify-send 'RESETINI' 'Stopping DMR2P25' --icon=dialog-information --urgency=critical
pkill -f DMR2P25
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DMR2P25.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DMR2P25.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DMR2P25.ini /usr/local/etc/MMDVMConf/DMR2P25_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2P25/DMR2P25.ini /usr/local/etc/MMDVMConf/DMR2P25.ini
sleep 5
echo "[RESETINI][$(date)] ===== DMR2P25.ini Rebuilt Successful. Remember to Edit the DMR2P25.ini ====="
notify-send 'RESETINI' 'DMR2P25.ini Rebuilt Successful. Remember to Edit the DMR2P25.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
