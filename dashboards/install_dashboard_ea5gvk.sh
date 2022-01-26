#!/bin/bash

LOG_DIRECTORY="/var/log/MMDVM"
APP="MMDVMHost-Dashboard"
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
sudo apt-get install -y lighttpd php php-common php-cgi sqlite3 php-sqlite3
sleep 5
# Create a group for webserver and add pi to it
echo "[BUILD][$(date)] ===== Creating www-data ====="
notify-send 'BUILD' 'Creating www-data' --icon=dialog-information --urgency=critical
sudo groupadd www-data
sudo usermod -G www-data -a pi
sleep 5
#Set Permissions
echo "[BUILD][$(date)] ===== Setting Permissions ====="
notify-send 'BUILD' 'Setting Permissions' --icon=dialog-information --urgency=critical
sudo chown -R www-data: www-data /var/www/html
sudo chmod -R 775 /var/www/html
sleep 5
#Enable plugins
echo "[BUILD][$(date)] ===== Enabling Lighttpd Plugins ====="
notify-send 'BUILD' 'Enabling Lighttpd Plugins' --icon=dialog-information --urgency=critical
sudo lighty-enable-mod fastcgi
sudo lighty-enable-mod fastcgi-php
sleep 5
#Download Source
echo "[BUILD][$(date)] ===== Downloading MMDVMHost-Dashboard ====="
notify-send 'BUILD' 'Downloading MMDVMHost-Dashboard' --icon=dialog-information
git clone https://github.com/ea5gvk/MMDVMHost-Dashboard.git /home/pi/Applications/MMDVMHost-Dashboard
sleep 5
#Copy to /var/www/html/
echo "[BUILD][$(date)] ===== Copying MMDVMHost-Dashboard ====="
notify-send 'BUILD' 'Copying MMDVMHost-Dashboard' --icon=dialog-information --urgency=critical
sudo cp -r /home/pi/Applications/MMDVMHost-Dashboard/* /var/www/html/
sleep 5
#Restart lighttpd
echo "[BUILD][$(date)] ===== Restarting Lighttpd ====="
notify-send 'BUILD' 'Restarting Lighttpd' --icon=dialog-information --urgency=critical
sudo systemctl force-reload lighttpd 
sleep 5
#Open Browser and Configure
echo "[BUILD][$(date)] ===== Opening Your Browser for Setup ====="
notify-send 'BUILD' 'Opening Your Browser for Setup' --icon=dialog-information
chromium-browser localhost/index.php &>/dev/null &
sleep 5
#Remove Dashboard Setup
echo "[BUILD][$(date)] ===== Remember to Remove Dashboard Setup! ====="
notify-send 'BUILD' 'Remember to Remove Dashboard Setup!' --icon=dialog-information --urgency=critical

sleep 10

exit
