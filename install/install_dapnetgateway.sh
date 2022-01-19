#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="DAPNETGateway"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading DAPNETGateway ====="
notify-send 'BUILD' 'Downloading DAPNETGateway' --icon=dialog-information
git clone https://github.com/g4klx/DAPNETGateway.git /home/pi/Applications/DAPNETGateway
sleep 5
echo "[BUILD][$(date)] ===== Building DAPNETGateway from Repository ====="
notify-send 'BUILD' 'Building DAPNETGateway from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/DAPNETGateway
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying ini Files ====="
notify-send 'BUILD' 'Copying ini Files' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DAPNETGateway.ini /usr/local/etc/MMDVMConf
sleep 5
echo "[BUILD][$(date)] ===== DAPNETGateway Built Successfully ====="
notify-send 'BUILD' 'DAPNETGateway Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
