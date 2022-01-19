#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="YSFClients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading YSFClients ====="
notify-send 'BUILD' 'Downloading YSFClients' --icon=dialog-information
git clone https://github.com/g4klx/YSFClients.git /home/pi/Applications/YSFClients
sleep 5
echo "[BUILD][$(date)] ===== Building YSFClients from Repository ====="
notify-send 'BUILD' 'Building YSFClients from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/YSFClients
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying YSFGateway.ini from Repository ====="
notify-send 'BUILD' 'Copying YSFGateway.ini from Repository' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/YSFGateway.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DGIdGateway.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/YSFReflector.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/hosts/FCSRooms.txt /usr/local/etc/MMDVMHost
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/hosts/YSFHosts.txt /usr/local/etc/MMDVMHost
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-share/scripts/YSFHostsupdate.sh /usr/local/share/scripts
sleep 5
echo "[BUILD][$(date)] ===== YSFClients Built Successfully ====="
notify-send 'BUILD' 'YSFClients Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
