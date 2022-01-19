#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="NXDN2DMR"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping NXDN2DMR ====="
notify-send 'RESETINI' 'Stopping NXDN2DMR' --icon=dialog-information --urgency=critical
pkill -f NXDN2DMR
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding NXDN2DMR.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding NXDN2DMR.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/NXDN2DMR.ini /usr/local/etc/MMDVMConf/NXDN2DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/NXDN2DMR/NXDN2DMR.ini /usr/local/etc/MMDVMConf/NXDN2DMR.ini
sleep 5
echo "[RESETINI][$(date)] ===== NXDN2DMR.ini Rebuilt Successful. Remember to Edit the NXDN2DMR.ini ====="
notify-send 'RESETINI' 'NXDN2DMR.ini Rebuilt Successful. Remember to Edit the NXDN2DMR.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
