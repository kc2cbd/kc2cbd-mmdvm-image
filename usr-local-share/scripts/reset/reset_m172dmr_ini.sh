#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M172DMR"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping M172DMR ====="
notify-send 'RESETINI' 'Stopping M172DMR' --icon=dialog-information --urgency=critical
pkill -f M172DMR
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding M172DMR.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding M172DMR.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/M172DMR.ini /usr/local/etc/MMDVMConf/M172DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/M172DMR/M172DMR.ini /usr/local/etc/MMDVMConf/M172DMR.ini
sleep 5
echo "[RESETINI][$(date)] ===== M172DMR.ini Rebuilt Successful. Remember to Edit the M172DMR.ini ====="
notify-send 'RESETINI' 'M172DMR.ini Rebuilt Successful. Remember to Edit the M172DMR.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
