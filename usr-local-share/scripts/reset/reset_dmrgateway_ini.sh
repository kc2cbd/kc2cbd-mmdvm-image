#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMRGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DMRGateway ====="
notify-send 'RESETINI' 'Stopping DMRGateway' --icon=dialog-information --urgency=critical
pkill -f DMRGateway
sleep 2
echo "[RESETINI][$(date)] ===== Rebuilding DMRGateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DMRGateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DMRGateway.ini /usr/local/etc/MMDVMConf/DMRGateway_$(date +'%F').ini
cp /home/pi/Applications/DMRGateway/DMRGateway.ini /usr/local/etc/MMDVMConf/DMRGateway.ini
sleep 2
echo "[RESETINI][$(date)] ===== DMRGateway.ini Rebuilt Successful. Remember to Edit the DMRGateway.ini ====="
notify-send 'RESETINI' 'DMRGateway.ini Rebuilt Successful. Remember to Edit the DMRGateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
