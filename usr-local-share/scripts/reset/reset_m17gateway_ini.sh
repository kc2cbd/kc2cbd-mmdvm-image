#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Gateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping M17Gateway ====="
notify-send 'RESETINI' 'Stopping M17Gateway' --icon=dialog-information --urgency=critical
pkill -f M17Gateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding M17Gateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding M17Gateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/M17Gateway.ini /usr/local/etc/MMDVMConf/M17Gateway_$(date +'%F').ini
cp /home/pi/Applications/M17Gateway/M17Gateway.ini /usr/local/etc/MMDVMConf/M17Gateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== M17Gateway.ini Rebuilt Successful. Remember to Edit the M17Gateway.ini ====="
notify-send 'RESETINI' 'M17Gateway.ini Rebuilt Successful. Remember to Edit the M17Gateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
