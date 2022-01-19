#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="NXDNClients"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Downloading NXDNClients ====="
notify-send 'BUILD' 'Downloading NXDNClients' --icon=dialog-information
git clone https://github.com/g4klx/NXDNClients.git /home/pi/Applications/NXDNClients
sleep 5
echo "[BUILD][$(date)] ===== Building NXDNClients from Repository ====="
notify-send 'BUILD' 'Building NXDNClients from Repository ' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/NXDNClients
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying NXDNGateway Files ====="
notify-send 'BUILD' 'Copying NXDNGateway Files' --icon=dialog-information
sudo mkdir -p /usr/local/share/NXDNGateway
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/NXDNGateway.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/NXDNReflector.ini /usr/local/etc/MMDVMConf
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/hosts/NXDNHosts.txt /usr/local/etc/MMDVMHost
sudo cp /home/pi/Applications/NXDNClients/NXDNGateway/Audio/* /usr/local/share/NXDNGateway
cd /home/pi/Downloads
wget https://www.radioid.net/static/nxdn.csv
sudo cp /home/pi/Downloads/nxdn.csv /usr/local/etc/MMDVMHost/NXDN.csv
sleep 5
echo "[BUILD][$(date)] ===== NXDNClients Built Successfully ====="
notify-send 'BUILD' 'NXDNClients Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
