#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DMRGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading DMRGateway ====="
notify-send 'BUILD' 'Downloading DMRGateway' --icon=dialog-information
git clone https://github.com/g4klx/DMRGateway.git /home/pi/Applications/DMRGateway
sleep 5
echo "[BUILD][$(date)] ===== Building DMRGateway from Repository ====="
notify-send 'BUILD' 'Building DMRGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DMRGateway
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying ini Files ====="
notify-send 'BUILD' 'Copying ini Files' --icon=dialog-information
sudo mkdir -p /usr/local/share/DMRGateway
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DMRGateway.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/DMRGateway/Audio/* /usr/local/share/DMRGateway
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/hosts/DMRIds.dat /usr/local/etc/MMDVMHost
sleep 5
echo "[BUILD][$(date)] ===== DMRGateway Built Successfully ====="
notify-send 'BUILD' 'DMRGateway Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
