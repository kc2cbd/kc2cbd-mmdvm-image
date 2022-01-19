#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="APRSGateway_"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading APRSGateway ====="
notify-send 'BUILD' 'Downloading APRSGateway' --icon=dialog-information
git clone https://github.com/g4klx/APRSGateway.git /home/pi/Applications/APRSGateway
sleep 5
echo "[BUILD][$(date)] ===== Building APRSGateway from Repository ====="
notify-send 'BUILD' 'Building APRSGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/APRSGateway
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying ini Files ====="
notify-send 'BUILD' 'Copying ini Files' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/APRSGateway.ini /usr/local/etc/MMDVMConf
sleep 5
echo "[BUILD][$(date)] ===== APRSGateway Built Successfully ====="
notify-send 'BUILD' 'APRSGateway Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
