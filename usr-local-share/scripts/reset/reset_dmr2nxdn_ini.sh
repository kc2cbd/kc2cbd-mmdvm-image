#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMR2NXDN"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DMR2NXDN ====="
notify-send 'RESETINI' 'Stopping DMR2NXDN' --icon=dialog-information --urgency=critical
pkill -f DMR2NXDN
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DMR2NXDN.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DMR2NXDN.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DMR2NXDN.ini /usr/local/etc/MMDVMConf/DMR2NXDN_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2NXDN/DMR2NXDN.ini /usr/local/etc/MMDVMConf/DMR2NXDN.ini
sleep 5
echo "[RESETINI][$(date)] ===== DMR2NXDN.ini Rebuilt Successful. Remember to Edit the DMR2NXDN.ini ====="
notify-send 'RESETINI' 'DMR2NXDN.ini Rebuilt Successful. Remember to Edit the DMR2NXDN.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
