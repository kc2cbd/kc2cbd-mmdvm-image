#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMHost"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading MMDVMHost ====="
notify-send 'BUILD' 'Downloading MMDVMHost' --icon=dialog-information
git clone https://github.com/g4klx/MMDVMHost.git /home/pi/Applications/MMDVMHost
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVMHost from Repository ====="
notify-send 'BUILD' 'Building MMDVMHost from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVMHost
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying MMDVMHost.ini from Repository ====="
notify-send 'BUILD' 'Copying MMDVMHost.ini from Repository' --icon=dialog-information
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/MMDVM.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/MMDVMHost/RSSI.dat /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-share/scripts/DMRIDUpdate.sh /usr/local/share/scripts
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-share/scripts/DMRIDUpdateBM.sh /usr/local/share/scripts
sleep 5
echo "[BUILD][$(date)] ===== MMDVMHost Built Successfully ====="
notify-send 'BUILD' 'MMDVMHost Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
