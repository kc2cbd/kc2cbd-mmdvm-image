#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="ircDDBGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping ircDDBGateway ====="
notify-send 'RESETINI' 'Stopping ircDDBGateway' --icon=dialog-information --urgency=critical
pkill -f ircDDBGateway
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding ircDDBGateway.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding ircDDBGateway.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/ircDDBGateway.ini /usr/local/etc/MMDVMConf/ircDDBGateway_$(date +'%F').ini
cp /home/pi/Applications/ircDDBGateway/ircDDBGateway.ini /usr/local/etc/MMDVMConf/ircDDBGateway.ini
sleep 5
echo "[RESETINI][$(date)] ===== ircDDBGateway.ini Rebuilt Successful. Remember to Edit the ircDDBGateway.ini ====="
notify-send 'RESETINI' 'ircDDBGateway.ini Rebuilt Successful. Remember to Edit the ircDDBGateway.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
