#!/bin/bash

#Install Required Software
echo "Installing Required Software"
sudo apt-get update && sudo apt-get -y install synaptic git build-essential default-jdk mlocate screen libnotify-bin geany hamradiomenus dmrconfig dsdcc libhamlib-utils multimon multimon-ng
sleep 5

# VNC Mods
echo "Creating VNC Mods"
sudo bash -c 'echo " " >> /boot/config.txt'
sudo bash -c 'echo "# Change VNC Resolution" >> /boot/config.txt'
sudo bash -c 'echo "hdmi_force_hotplug=1" >> /boot/config.txt'
sudo bash -c 'echo "hdmi_ignore_edid=0xa5000080" >> /boot/config.txt'
sudo bash -c 'echo "hdmi_group=2" >> /boot/config.txt'
sudo bash -c 'echo "hdmi_mode=51" >> /boot/config.txt'
sleep 5

# DV-Mega Mods
echo "Creating DV-Mega Mods"
sudo systemctl stop serial-getty@ttyAMA0.service
sudo systemctl disable serial-getty@ttyAMA0.service
sudo systemctl stop hciuart
sudo systemctl disable hciuart
sudo sed -i -e 's/console=serial0,115200 console=tty1/console=tty1/' /boot/cmdline.txt
sudo sed -i -e 's/enable_uart=0/enable_uart=1/' /boot/config.txt
sudo bash -c 'echo " " >> /boot/config.txt'
sudo bash -c 'echo "# Disable Bluetooth on Raspberry Pi 3" >> /boot/config.txt'
sudo bash -c 'echo "dtoverlay=pi3-disable-bt" >> /boot/config.txt'
sleep 5

#Create Ham Radio Menu Directory
echo "Creating Amateur Radio Menus"
sudo cp /home/pi/Applications/kc2cbd-image/AmateurRadio.menu /etc/xdg/menus/applications-merged/
sleep 5

# Directory Pre-Requisites
echo "Creating Needed Directories"
notify-send 'Creating Needed Directories' --icon=dialog-information --urgency=critical
sudo mkdir -p /usr/local/share/scripts
sudo chown -R pi:pi /usr/local/share/scripts
sudo chmod +777 /usr/local/share/scripts
sudo mkdir /usr/local/etc/MMDVMHost
sudo mkdir /usr/local/etc/MMDVMHost/private
sudo chown -R pi:pi /usr/local/etc/MMDVMHost
sudo chmod +777 /usr/local/etc/MMDVMHost
sudo mkdir /usr/local/etc/MMDVMConf
sudo chown -R pi:pi /usr/local/etc/MMDVMConf
sudo chmod +777 /usr/local/etc/MMDVMConf
sudo mkdir /var/log/MMDVM
sudo chown -R pi:pi /var/log/MMDVM
sudo chmod +777 /var/log/MMDVM
sleep 5

#Create Logrotate File
echo "Creating Logrotate File"
notify-send 'Creating Logrotate File' --icon=dialog-information --urgency=critical
sudo cp /home/pi/Applications/kc2cbd-mmdvm-image/MMDVM_logrotate /etc/logrotate.d/MMDVM
sleep 5

#Copy Needed Scripts
echo "Copying Scripts"
notify-send 'Copying Scripts' --icon=dialog-information --urgency=critical
cp -r /home/pi/Applications/kc2cbd-mmdvm-image/usr-local-share/scripts/* /usr/local/share/scripts

echo "Your Device will now REBOOT!"
notify-send 'Your Device will now REBOOT!' --icon=dialog-information --urgency=critical

sleep 20

reboot
