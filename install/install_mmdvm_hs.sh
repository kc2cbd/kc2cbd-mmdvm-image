#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVM_HS"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

echo "[BUILD][$(date)] ===== Updating system ====="
notify-send 'BUILD' 'Updating system' --icon=dialog-information --urgency=critical
sudo apt-get update && sudo apt-get -y full-upgrade
sleep 5
echo "[BUILD][$(date)] ===== Installing Need Applications ====="
notify-send 'BUILD' 'Installing Need Applications' --icon=dialog-information --urgency=critical
sudo apt-get -y install gcc-arm-none-eabi gdb-arm-none-eabi libstdc++-arm-none-eabi-newlib libnewlib-arm-none-eabi
sleep 5
# Preparing System for STM32
echo "Preparing System for STM32"
notify-send 'Preparing System for STM32' --icon=dialog-information --urgency=critical
git clone https://git.code.sf.net/p/stm32flash/code /home/pi/Applications/stm32flash
cd /home/pi/Applications/stm32flash
make
sudo make install
sleep 5
echo "[BUILD][$(date)] ===== Downloading MMDVM_HS ====="
notify-send 'BUILD' 'Downloading MMDVM_HS' --icon=dialog-information
git clone https://github.com/juribeparada/MMDVM_HS.git /home/pi/Applications/MMDVM_HS
cd /home/pi/Applications/MMDVM_HS
git submodule init
git submodule update
sleep 5
echo "[BUILD][$(date)] ===== MMDVM_HS Built Successfully - Be Sure to Install firmware to Device====="
notify-send 'BUILD' 'MMDVM_HS Built Successfully - Be Sure to Install firmware to Device' --icon=dialog-information --urgency=critical
chromium-browser https://github.com/juribeparada/MMDVM_HS/tree/master/configs https://github.com/juribeparada/MMDVM_HS/blob/master/BUILD.md &>/dev/null &

sleep 10

exit
