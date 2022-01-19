#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="USRP2P25"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping USRP2P25 ====="
notify-send 'RESETINI' 'Stopping USRP2P25' --icon=dialog-information --urgency=critical
pkill -f USRP2P25
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding USRP2P25.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding USRP2P25.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/USRP2P25.ini /usr/local/etc/MMDVMConf/USRP2P25_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2P25/USRP2P25.ini /usr/local/etc/MMDVMConf/USRP2P25.ini
sleep 5
echo "[RESETINI][$(date)] ===== USRP2P25.ini Rebuilt Successful. Remember to Edit the USRP2P25.ini ====="
notify-send 'RESETINI' 'USRP2P25.ini Rebuilt Successful. Remember to Edit the USRP2P25.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
