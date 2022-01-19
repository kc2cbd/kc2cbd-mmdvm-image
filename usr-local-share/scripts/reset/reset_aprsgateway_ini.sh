#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="APRSGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping APRSGateway ====="
notify-send 'RESETINI' 'Stopping APRSGateway' --icon=dialog-information --urgency=critical
pkill -f APRSGateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding APRSGateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding APRSGateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/APRSGateway.ini /usr/local/etc/MMDVMConf/APRSGateway_$(date +'%F').ini
cp /home/pi/Applications/APRSGateway/APRSGateway.ini /usr/local/etc/MMDVMConf/APRSGateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== APRSGateway.ini Rebuilt Successful. Remember to Edit the APRSGateway.ini ====="
notify-send 'RESETINI' 'APRSGateway.ini Rebuilt Successful. Remember to Edit the APRSGateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
