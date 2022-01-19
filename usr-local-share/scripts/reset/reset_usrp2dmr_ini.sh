#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="USRP2DMR"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping USRP2DMR ====="
notify-send 'RESETINI' 'Stopping USRP2DMR' --icon=dialog-information --urgency=critical
pkill -f USRP2DMR
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding USRP2DMR.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding USRP2DMR.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/USRP2DMR.ini /usr/local/etc/MMDVMConf/USRP2DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2DMR/USRP2DMR.ini /usr/local/etc/MMDVMConf/USRP2DMR.ini
sleep 5
echo "[RESETINI][$(date)] ===== USRP2DMR.ini Rebuilt Successful. Remember to Edit the USRP2DMR.ini ====="
notify-send 'RESETINI' 'USRP2DMR.ini Rebuilt Successful. Remember to Edit the USRP2DMR.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
