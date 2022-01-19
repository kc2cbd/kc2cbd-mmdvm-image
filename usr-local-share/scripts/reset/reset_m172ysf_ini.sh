#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="M172YSF"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping M172YSF ====="
notify-send 'RESETINI' 'Stopping M172YSF' --icon=dialog-information --urgency=critical
pkill -f M172YSF
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding M172YSF.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding M172YSF.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/M172YSF.ini /usr/local/etc/MMDVMConf/M172YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/M172YSF/M172YSF.ini /usr/local/etc/MMDVMConf/M172YSF.ini
sleep 5
echo "[RESETINI][$(date)] ===== M172YSF.ini Rebuilt Successful. Remember to Edit the M172YSF.ini ====="
notify-send 'RESETINI' 'M172YSF.ini Rebuilt Successful. Remember to Edit the M172YSF.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
