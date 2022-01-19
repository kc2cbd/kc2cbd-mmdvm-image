#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="NXDNGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping NXDNGateway ====="
notify-send 'RESETINI' 'Stopping NXDNGateway' --icon=dialog-information --urgency=critical
pkill -f NXDNGateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding NXDNGateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding NXDNGateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/NXDNGateway.ini /usr/local/etc/MMDVMConf/NXDNGateway_$(date +'%F').ini
cp /home/pi/Applications/NXDNGateway/NXDNGateway.ini /usr/local/etc/MMDVMConf/NXDNGateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== NXDNGateway.ini Rebuilt Successful. Remember to Edit the NXDNGateway.ini ====="
notify-send 'RESETINI' 'NXDNGateway.ini Rebuilt Successful. Remember to Edit the NXDNGateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
