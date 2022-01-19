#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M17Client"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping M17Client ====="
notify-send 'RESETINI' 'Stopping M17Client' --icon=dialog-information --urgency=critical
pkill -f M17Client
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding M17Client.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding M17Client.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/M17Client.ini /usr/local/etc/MMDVMConf/M17Client_$(date +'%F').ini
cp /home/pi/Applications/M17Client/Daemon/M17Client.ini /usr/local/etc/MMDVMConf/M17Client.ini
sleep 5
echo "[RESETINI][$(date)] ===== M17Client.ini Rebuilt Successful. Remember to Edit the M17Client.ini ====="
notify-send 'RESETINI' 'M17Client.ini Rebuilt Successful. Remember to Edit the M17Client.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
