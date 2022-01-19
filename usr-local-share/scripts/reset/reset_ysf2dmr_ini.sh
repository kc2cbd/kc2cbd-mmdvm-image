#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="YSF2DMR"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping YSF2DMR ====="
notify-send 'RESETINI' 'Stopping YSF2DMR' --icon=dialog-information --urgency=critical
pkill -f YSF2DMR
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding YSF2DMR.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding YSF2DMR.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/YSF2DMR.ini /usr/local/etc/MMDVMConf/YSF2DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/YSF2DMR/YSF2DMR.ini /usr/local/etc/MMDVMConf/YSF2DMR.ini
sleep 5
echo "[RESETINI][$(date)] ===== YSF2DMR.ini Rebuilt Successful. Remember to Edit the YSF2DMR.ini ====="
notify-send 'RESETINI' 'YSF2DMR.ini Rebuilt Successful. Remember to Edit the YSF2DMR.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
