#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="P25Gateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping P25Gateway ====="
notify-send 'RESETINI' 'Stopping P25Gateway' --icon=dialog-information --urgency=critical
pkill -f P25Gateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding P25Gateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding P25Gateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/P25Gateway.ini /usr/local/etc/MMDVMConf/P25Gateway_$(date +'%F').ini
cp /home/pi/Applications/P25Clients/P25Gateway.ini /usr/local/etc/MMDVMConf/P25Gateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== P25Gateway.ini Rebuilt Successful. Remember to Edit the P25Gateway.ini ====="
notify-send 'RESETINI' 'P25Gateway.ini Rebuilt Successful. Remember to Edit the P25Gateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
