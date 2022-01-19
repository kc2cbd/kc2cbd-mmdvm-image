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

# Installing Arduino IDE
echo "Installing Arduino IDE"
notify-send 'Installing Arduino IDE' --icon=dialog-information --urgency=critical
sudo apt-get -y install arduino arduino-builder arduino-core-avr arduino-ctags flashrom
sleep 5
# Install DUE Board Library
echo "[BUILD][$(date)] ===== Installing SAM Boards ====="
notify-send 'BUILD' 'Installing SAM Boards' --icon=dialog-information
arduino --install-boards arduino:sam
sleep 5
# Modify Platform.txt for Arduino DUE
echo "[BUILD][$(date)] ===== Modify Platform.txt ====="
notify-send 'BUILD' 'Modify Platform.txt' --icon=dialog-information
/home/pi/Applications/kc2cbd-mmdvm-image/modify_platform.sh
sleep 5
# Download Firmware Source Code
echo "Downloading Needed Firmware Files"
notify-send 'Downloading Needed Firmware Files' --icon=dialog-information --urgency=critical
git clone https://github.com/g4klx/MMDVM.git /home/pi/Applications/MMDVM
sleep 5
echo "[BUILD][$(date)] ===== MMDVMHost Built Successfully - Use Arduino IDE to build and update Firmware ====="
notify-send 'BUILD' 'MMDVMHost Built Successfully - Use Arduino IDE to build and update Firmware' --icon=dialog-information --urgency=critical
chromium-browser https://github.com/g4klx/MMDVM/blob/master/BUILD.txt &>/dev/null &

sleep 10

exit
