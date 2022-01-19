#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DAPNETGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DAPNETGateway ====="
notify-send 'RESETINI' 'Stopping DAPNETGateway' --icon=dialog-information --urgency=critical
pkill -f DAPNETGateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DAPNETGateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DAPNETGateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DAPNETGateway.ini /usr/local/etc/MMDVMConf/DAPNETGateway_$(date +'%F').ini
cp /home/pi/Applications/DAPNETGateway/DAPNETGateway.ini /usr/local/etc/MMDVMConf/DAPNETGateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== DAPNETGateway.ini Rebuilt Successful. Remember to Edit the DAPNETGateway.ini ====="
notify-send 'RESETINI' 'DAPNETGateway.ini Rebuilt Successful. Remember to Edit the DAPNETGateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
