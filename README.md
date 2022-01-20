# MMDVM Raspberry Pi Image Scripts

### Purpose
This is based on Chris Andrist, KC7WSU's build to include more Applications from Jonathan Naylor, G4KLX. This process is used to create the DMR-UTAH MMDVM Images available [here](http://www.dmr-utah.net/support/mmdvm/images/).

This will enable you to take a stock Raspbian Bullseye OS and have a complete MMDVM System to your liking.

It includes install scripts for the following Applications under /home/pi/Applications/kc2cbd-mmdvm-image/install
There is an install script to install them with just one bash script.

1.  APRSGateway - https://github.com/g4klx/APRSGateway
2.  DAPNETGateway -https://github.com/g4klx/DAPNETGateway
3.  DMRGateway - https://github.com/g4klx/DMRGateway
4.  ircDDBGateway - https://github.com/g4klx/ircDDBGateway
5.  M17Gateway - https://github.com/g4klx/M17Gateway
6.  MMDVM - Firmware for MMDVM - https://github.com/g4klx/MMDVM
7.  MMDVM_CM - juribeparada's Cross Mode Utilities - https://github.com/juribeparada/MMDVM_CM
8.  MMDVM_HS - Firmware for Hotspots - https://github.com/juribeparada/MMDVM_HS
9.  MMDVM_man - MMDVM STM32 Manuals - https://github.com/VR2VYE/MMDVM_man
10. MMDVMcal - https://github.com/g4klx/MMDVMcal
11. MMDVMHost - https://github.com/g4klx/MMDVMHost
12. NXDNClients - https://github.com/g4klx/NXDNClients
13. P25Clients - https://github.com/g4klx/P25Clients
14. YSFClients - https://github.com/g4klx/YSFClients

The Following are under /home/pi/Applications/kc2cbd-mmdvm-image/install/other

1. DStarRepeater - https://github.com/g4klx/DStarRepeater
2. DummyRepeater - https://github.com/g4klx/DummyRepeater
3. FMRepeater - https://github.com/g4klx/FMRepeater
4. M17Client - https://github.com/g4klx/M17Client
5. MMDVM-UDRC - (Not sure if this works) - https://github.com/g4klx/MMDVM-UDRC

The Following are under /home/pi/Applications/kc2cbd-mmdvm-image/dashboards

1. DG9VH Dashboard - https://github.com/dg9vh/MMDVMHost-Dashboard
2. DG9VH Dashboard from EA5GVK - EA5GVK Modded DG9VH's Dashboard with New Features - https://github.com/ea5gvk/MMDVMHost-Dashboard
3. DG9VH MMDVMHost-Websocketboard - Lower load version of Dashboard - https://github.com/dg9vh/MMDVMHost-Websocketboard

You may install as many as you like.

### Step-by-Step
1. Basic Raspberry Pi Config
	- sudo raspi-config
		- Expand Filesystem
		- Disable Serial
		- Enable VNC
		- Localization
	- sudo reboot

2. Update Raspberry Pi
	- sudo apt update && sudo apt -y full-upgrade
	- sudo reboot
 
3. Download Scripts
	- git clone https://github.com/kc2cbd/kc2cbd-mmdvm-image.git /home/pi/Applications/kc2cbd-image

4. Run initial install file from  "lxTerminal"
	- /home/pi/Applications/kc2cbd-mmdvm-image/install.sh
	- Raspberry Pi will reboot when Initial Install finishes

5. If you just would like a system with the apps that are included with Pi-Star then run the following.
	- /home/pi/Applications/kc2cbd-mmdvm-image/install_MMDVM_Combined.sh
		- This installs just the needed applications with one command.
		- If you choose this option then just choose and install your chosen Dashboard.
	- OR
	Install the Applications that you would like included on your system individually and continue to the next step.
	- /home/pi/Applications/kc2cbd-mmdvm-image/install/install_xxx.sh
	- xxx = name of Application.

6. Create Shortcuts for the Applications you've installed individually.
	- sudo /home/pi/Applications/kc2cbd-mmdvm-image/shortcuts_xxx.sh
	- Create the Shortcuts according to what you installed.
	- xxx = name of Application

7. Create the Services you will need according to the Applications you've installed
	- sudo /home/pi/Applications/kc2cbd-mmdvm-image/create_xxx_service.sh
	- xxx = name of Application

8. Install Web Dashboard of your choice
	- sudo /home/pi/Applications/kc2cbd-image/dashboards/install_xxx.sh
	- xxx being your Dashboard of choice

9. From Amateur Radio Menu you can
	- Rebuild From Source
	- Reset xxx.ini
	- Update Applications

10. Cleanup
	- /home/pi/Applications/kc2cbd-mmdvm-image/cleanup.sh

11. You should have installed MMDVM and MMDVM_HS so you have firmware for your board.
	- Be sure to choose the firmware according to the Board you have
		- MMDVM - Generally Arduino based boards
			- SQ6POG Board
			- ZUM V1.0 and V1.0.1 - Arduino DUE ZUM Boards
			- SP8NTH Board
			- ST Nucleo-64 STM32F446RE Board

		- MMDVM_HS - STM32 Based Hotspots and Repeater Boards
			- D2RG_MMDVM_HS
			- LoneStar_USB
			- MMDVM_HS_Dual_Hat-12mhz - 12.2880 TCXO installed
			- MMDVM_HS_Dual_Hat - 14.7456 TCXO installed
			- MMDVM_HS_Hat
			- NanoDV_NPI
			- NanoDV_USB
			- Nano_hotSpot
			- SkyBridge_RPi
			- ZUMspot_Libre
			- ZUMspot_RPi
			- ZUMspot_USB
			- ZUMspot_dualband
			- ZUMspot_duplex
			- generic_duplex_gpio
			- generic_duplex_usb
			- generic_gpio

### Pertinent File Locations

Everything that has a install is installed to /usr/local/bin

All .ini files for the modes are in /usr/local/etc/MMDVMConf

All lookup data files are in /usr/local/etc/MMDVMHost

All the Scripts are in /usr/local/share/scripts

All git repositories are downloaded to /home/pi/Applications

All the logs are in /var/log/MMDVM

