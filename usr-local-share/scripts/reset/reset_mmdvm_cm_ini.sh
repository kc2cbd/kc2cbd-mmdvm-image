#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_CM"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[RESETINI][$(date)] ===== Stopping MMDVM_CM ====="
notify-send 'RESETINI' 'Stopping MMDVM_CM' --icon=dialog-information --urgency=critical
pkill -f DMR2M17
pkill -f DMR2NXDN
pkill -f DMR2P25
pkill -f DMR2YSF
#pkill -f DSTAR2YSF
pkill -f M172DMR
pkill -f M172YSF
pkill -f NXDN2DMR
pkill -f P252DMR
pkill -f USRP2DMR
pkill -f USRP2M17
pkill -f USRP2P25
pkill -f USRP2YSF
pkill -f YSF2DMR
pkill -f YSF2NXDN
pkill -f YSF2P25
sleep 5
echo "[RESETINI][$(date)] ===== Rebuilding ini Files from Repository ====="
notify-send 'RESETINI' 'Rebuilding ini Files from Repository' --icon=dialog-information --urgency=critical
mv /usr/local/etc/MMDVMConf/DMR2M17.ini /usr/local/etc/MMDVMConf/DMR2M17_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2M17/DMR2M17.ini /usr/local/etc/MMDVMConf/DMR2M17.ini
mv /usr/local/etc/MMDVMConf/DMR2NXDN.ini /usr/local/etc/MMDVMConf/DMR2NXDN_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2NXDN/DMR2NXDN.ini /usr/local/etc/MMDVMConf/DMR2NXDN.ini
mv /usr/local/etc/MMDVMConf/DMR2P25.ini /usr/local/etc/MMDVMConf/DMR2P25_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2P25/DMR2P25.ini /usr/local/etc/MMDVMConf/DMR2P25.ini
mv /usr/local/etc/MMDVMConf/DMR2YSF.ini /usr/local/etc/MMDVMConf/DMR2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2YSF/DMR2YSF.ini /usr/local/etc/MMDVMConf/DMR2YSF.ini
mv /usr/local/etc/MMDVMConf/DMR2YSF.ini /usr/local/etc/MMDVMConf/DMR2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DMR2YSF/DMR2YSF.ini /usr/local/etc/MMDVMConf/DMR2YSF.ini
mv /usr/local/etc/MMDVMConf/DSTAR2YSF.ini /usr/local/etc/MMDVMConf/DSTAR2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/DSTAR2YSF/DSTAR2YSF.ini /usr/local/etc/MMDVMConf/DSTAR2YSF.ini
mv /usr/local/etc/MMDVMConf/M172DMR.ini /usr/local/etc/MMDVMConf/M172DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/M172DMR/M172DMR.ini /usr/local/etc/MMDVMConf/M172DMR.ini
mv /usr/local/etc/MMDVMConf/M172YSF.ini /usr/local/etc/MMDVMConf/M172YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/M172YSF/M172YSF.ini /usr/local/etc/MMDVMConf/M172YSF.ini
mv /usr/local/etc/MMDVMConf/NXDN2DMR.ini /usr/local/etc/MMDVMConf/NXDN2DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/NXDN2DMR/NXDN2DMR.ini /usr/local/etc/MMDVMConf/NXDN2DMR.ini
mv /usr/local/etc/MMDVMConf/P252DMR.ini /usr/local/etc/MMDVMConf/P252DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/P252DMR/P252DMR.ini /usr/local/etc/MMDVMConf/P252DMR.ini
mv /usr/local/etc/MMDVMConf/USRP2DMR.ini /usr/local/etc/MMDVMConf/USRP2DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2DMR/USRP2DMR.ini /usr/local/etc/MMDVMConf/USRP2DMR.ini
mv /usr/local/etc/MMDVMConf/USRP2M17.ini /usr/local/etc/MMDVMConf/USRP2M17_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2M17/USRP2M17.ini /usr/local/etc/MMDVMConf/USRP2M17.ini
mv /usr/local/etc/MMDVMConf/USRP2P25.ini /usr/local/etc/MMDVMConf/USRP2P25_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2P25/USRP2P25.ini /usr/local/etc/MMDVMConf/USRP2P25.ini
mv /usr/local/etc/MMDVMConf/USRP2YSF.ini /usr/local/etc/MMDVMConf/USRP2YSF_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/USRP2YSF/USRP2YSF.ini /usr/local/etc/MMDVMConf/USRP2YSF.ini
mv /usr/local/etc/MMDVMConf/YSF2DMR.ini /usr/local/etc/MMDVMConf/YSF2DMR_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/YSF2DMR/YSF2DMR.ini /usr/local/etc/MMDVMConf/YSF2DMR.ini
mv /usr/local/etc/MMDVMConf/YSF2NXDN.ini /usr/local/etc/MMDVMConf/YSF2NXDN_$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/YSF2NXDN/YSF2NXDN.ini /usr/local/etc/MMDVMConf/YSF2NXDN.ini
mv /usr/local/etc/MMDVMConf/YSF2P25.ini /usr/local/etc/MMDVMConf/YSF2P25$(date +'%F').ini
cp /home/pi/Applications/MMDVM_CM/YSF2P25/YSF2P25.ini /usr/local/etc/MMDVMConf/YSF2P25.ini
sleep 5
echo "[RESETINI][$(date)] ===== MMDVM_CM ini Files Rebuilt Successful. Remember to Edit your ini Files ====="
notify-send 'RESETINI' 'MMDVM_CM ini Files Rebuilt Successful. Remember to Edit your ini Files' --icon=dialog-information --urgency=critical

sleep 10

exit
