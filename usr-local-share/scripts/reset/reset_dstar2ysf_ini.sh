#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DSTAR2YSF"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping DSTAR2YSF ====="
notify-send 'RESETINI' 'Stopping DSTAR2YSF' --icon=dialog-information --urgency=critical
pkill -f DSTAR2YSF
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding DSTAR2YSF.ini from Repository ====="
notify-send 'RESETINI' 'Rebuilding DSTAR2YSF.ini from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DSTAR2YSF.ini /usr/local/etc/MMDVMConf/DSTAR2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DSTAR2YSF/DSTAR2YSF.ini /usr/local/etc/MMDVMConf/DSTAR2YSF.ini
sleep 5
echo "[RESETINI][$(date)] ===== DSTAR2YSF.ini Rebuilt Successful. Remember to Edit the DSTAR2YSF.ini ====="
notify-send 'RESETINI' 'DSTAR2YSF.ini Rebuilt Successful. Remember to Edit the DSTAR2YSF.ini' --icon=dialog-information --urgency=critical

sleep 10

exit
