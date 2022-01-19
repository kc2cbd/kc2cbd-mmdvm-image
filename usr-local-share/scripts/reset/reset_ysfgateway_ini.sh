#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="YSFGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping YSFGateway ====="
notify-send 'RESETINI' 'Stopping YSFGateway' --icon=dialog-information --urgency=critical
pkill -f YSFGateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding YSFGateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding YSFGateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/YSFGateway.ini /usr/local/etc/MMDVMConf/YSFGateway_$(date +'%F').ini
cp /home/pi/Applications/YSFClients/YSFGateway.ini /usr/local/etc/MMDVMConf/YSFGateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== YSFGateway.ini Rebuilt Successful. Remember to Edit the YSFGateway.ini ====="
notify-send 'RESETINI' 'YSFGateway.ini Rebuilt Successful. Remember to Edit the YSFGateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
