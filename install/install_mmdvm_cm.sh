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

echo "[BUILD][$(date)] ===== Installing Needed Applications ====="
notify-send 'BUILD' 'Installing Needed Applications' --icon=dialog-information
sudo apt-get update && sudo apt-get -y install git make cmake
sleep 5
echo "[BUILD][$(date)] ===== Downloading md380_vocoder ====="
notify-send 'BUILD' 'Downloading md380_vocoder' --icon=dialog-information
git clone https://github.com/nostar/md380_vocoder.git /home/pi/Applications/md380_vocoder
cd /home/pi/Applications/md380_vocoder
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Downloading imbe_vocoder ====="
notify-send 'BUILD' 'Downloading imbe_vocoder' --icon=dialog-information
git clone https://github.com/nostar/imbe_vocoder.git /home/pi/Applications/imbe_vocoder
cd /home/pi/Applications/imbe_vocoder
make clean
make
sudo make install
sudo ldconfig
sleep 5
echo "[BUILD][$(date)] ===== Downloading mbelib ====="
notify-send 'BUILD' 'Downloading mbelib' --icon=dialog-information
git clone https://github.com/szechyjs/mbelib.git /home/pi/Applications/mbelib
cd /home/pi/Applications/mbelib
mkdir build
cd build
cmake ..
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Downloading MMDVM_CM ====="
notify-send 'BUILD' 'Downloading MMDVM_CM' --icon=dialog-information
git clone https://github.com/juribeparada/MMDVM_CM.git /home/pi/Applications/MMDVM_CM
sleep 5
echo "[BUILD][$(date)] ===== Building MMDVM_CM from Repository ====="
notify-send 'BUILD' 'Building MMDVM_CM from Repository' --icon=dialog-information --urgency=critical
cd /home/pi/Applications/MMDVM_CM
sed -i 's+SUBDIRS = DMR2NXDN DMR2YSF NXDN2DMR YSF2DMR YSF2NXDN YSF2P25+SUBDIRS = DMR2M17 DMR2NXDN DMR2P25 DMR2YSF M172DMR NXDN2DMR P252DMR USRP2DMR USRP2M17 USRP2P25 YSF2DMR YSF2NXDN YSF2P25+g' Makefile
make clean
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Copying ini Files ====="
notify-send 'BUILD' 'Copying ini Files' --icon=dialog-information
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DMR2M17.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DMR2NXDN.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DMR2P25.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DMR2YSF.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/DSTAR2YSF.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/M172DMR.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/M172YSF.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/NXDN2DMR.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/P252DMR.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/USRP2DMR.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/USRP2M17.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/USRP2P25.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/USRP2YSF.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/YSF2DMR.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/YSF2NXDN.ini /usr/local/etc/MMDVMConf
cp /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-etc/conf/YSF2P25.ini /usr/local/etc/MMDVMConf
sleep 2
echo "[BUILD][$(date)] ===== MMDVM_CM Built Successfully ====="
notify-send 'BUILD' 'MMDVM_CM Built Successfully' --icon=dialog-information --urgency=critical

sleep 10

exit
