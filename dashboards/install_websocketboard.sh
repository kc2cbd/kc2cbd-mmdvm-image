#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="Websocketboard"
LOG_FILE="$LOG_DIRECTORY/${APP}_$(date +'%F').log"
if [ ! -d "$LOG_DIRECTORY" ]; then
        mkdir -p $LOG_DIRECTORY
fi

touch $LOG_FILE

exec > >(tee -a $LOG_FILE)
exec 2>&1

#Update System
echo "[BUILD][$(date)] ===== Updating System ====="
notify-send 'BUILD' 'Updating System' --icon=dialog-information --urgency=critical
sudo apt-get update && sudo apt-get -y full-upgrade
sleep 5
#Install needed Apps
echo "[BUILD][$(date)] ===== Installing Needed Applications ====="
notify-send 'BUILD' 'Installing Needed Applications' --icon=dialog-information --urgency=critical
sudo apt-get install -y git python3  python3-websockets python3-gpiozero python3-psutil python3-serial python3-pip colorized-logs
sudo pip3 install ansi2html
sleep 5
#Create MMDVM System User
echo "[BUILD][$(date)] ===== Creating MMDVM System User ====="
notify-send 'BUILD' 'Creating MMDVM System User' --icon=dialog-information --urgency=critical
sudo adduser --system --no-create-home --group mmdvm
sleep 5
#Add MMDVM User to dialout
echo "[BUILD][$(date)] ===== Adding MMDVM System User to dialout ====="
notify-send 'BUILD' 'Adding MMDVM System User to dialout' --icon=dialog-information --urgency=critical
sudo usermod -a -G dialout mmdvm
sleep 5
#Adding to sudoers
echo "[BUILD][$(date)] ===== Adding to sudoers ====="
notify-send 'BUILD' 'Adding to sudoers' --icon=dialog-information --urgency=critical
echo 'www-data ALL=(ALL) NOPASSWD: /usr/local/bin' | sudo tee -a /etc/sudoers
sleep 5
#Download Source
echo "[BUILD][$(date)] ===== Downloading MMDVMHost-Websocketboard ====="
notify-send 'BUILD' 'Downloading MMDVMHost-Websocketboard' --icon=dialog-information --urgency=critical
git clone --recurse-submodules -j8 https://github.com/dg9vh/MMDVMHost-Websocketboard.git /home/pi/Applications/MMDVMHost-Websocketboard
sleep 5
#Creating /opt/MMDVMDash
echo "[BUILD][$(date)] ===== Creating /opt/MMDVMDash ====="
notify-send 'BUILD' 'Creating /opt/MMDVMDash' --icon=dialog-information --urgency=critical
sudo mkdir -p /opt/MMDVMDash
sleep 5
#Copying Files
echo "[BUILD][$(date)] ===== Copying Files ====="
notify-send 'BUILD' 'Copying Files' --icon=dialog-information --urgency=critical
sudo cp -p -r /home/pi/Applications/MMDVMHost-Websocketboard/* /opt/MMDVMDash
sudo cp -p /home/pi/Applications/MMDVMHost-Websocketboard/systemd/* /lib/systemd/system
sleep 5
#Edit logtailer.ini
echo "[BUILD][$(date)] ===== Copying logtailer.ini ====="
notify-send 'BUILD' 'Copying logtailer.ini' --icon=dialog-information --urgency=critical
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/opt-MMDVMDash/logtailer.ini /opt/MMDVMDash/logtailer.ini
sleep 5
#Edit /html/js/config.js
echo "[BUILD][$(date)] ===== Copying /html/js/config.js ====="
notify-send 'BUILD' 'Copying /html/js/config.js' --icon=dialog-information --urgency=critical
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/opt-MMDVMDash/html/js/config.js /opt/MMDVMDash/html/js/config.js
sleep 5
#Set Permissions
echo "[BUILD][$(date)] ===== Setting Permissions ====="
notify-send 'BUILD' 'Setting Permissions' --icon=dialog-information --urgency=critical
sudo chown -R mmdvm:mmdvm /opt/MMDVMDash
sleep 5
#Enabling Services
echo "[BUILD][$(date)] ===== Enabling Services ====="
notify-send 'BUILD' 'Enabling Services' --icon=dialog-information --urgency=critical
# Make Service Executable
chmod 755 /lib/systemd/system/http.server.service
chmod 755 /lib/systemd/system/logtailer.service
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/http.server.service /etc/systemd/system/logtailer.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/http.server.service /etc/systemd/system/http.server.service
ln -s /lib/systemd/system/logtailer.service /etc/systemd/system/logtailer.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
sudo systemctl enable http.server.service
sudo systemctl enable logtailer.service
sleep 5
#Starting Services
echo "[BUILD][$(date)] ===== Starting Services ====="
notify-send 'BUILD' 'Starting Services' --icon=dialog-information --urgency=critical
sudo systemctl start http.server.service
sudo systemctl start logtailer.service
chromium-browser  https://github.com/dg9vh/MMDVMHost-Websocketboard/blob/main/README.md &>/dev/null &

sleep 10

exit
