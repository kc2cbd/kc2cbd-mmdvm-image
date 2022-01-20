#!/bin/bash

#Create DMRGateway Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/dmrgateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMRGateway Start
GenericName=DMRGateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/binDMRGateway /usr/local/etc/MMDVMConf/DMRGateway.ini"
Icon=
Terminal=false
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMRGateway Stop
GenericName=DMRGateway Stop
Exec=gksudo pkill -f /usr/local/bin/DMRGateway
Icon=
Terminal=false
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMRGateway Background Service Console
GenericName=DMRGateway Background Service Console
Exec=screen -r DMRGateway
Icon=
Terminal=true
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMRGateway Background Service Start
GenericName=DMRGateway Background Service Start
Exec=sudo systemctl start dmrgateway.service
Icon=
Terminal=false
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMRGateway Background Service Stop
GenericName=DMRGateway Background Service Stop
Exec=sudo systemctl stop dmrgateway.service
Icon=
Terminal=false
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DMRGateway Background Service Restart
GenericName=DMRGateway Background Service Restart
Exec=sudo systemctl restart dmrgateway.service
Icon=
Terminal=false
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update DMRGateway
GenericName=Update DMRGateway
Exec=/usr/local/share/scripts/update/update_dmrgateway.sh
Icon=
Terminal=true
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/edit_dmrgatewayini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DMRGateway.ini
GenericName=Edit DMRGateway.ini
Exec=sudo geany /usr/local/etc/MMDVMConf/DMRGateway.ini
Icon=
Terminal=false
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DMRGateway.ini
GenericName=Reset DMRGateway.ini
Exec=/usr/local/share/scripts/reset/reset_dmrgateway_ini.sh
Icon=
Terminal=true
Categories=DMR;
EOL

cat > /home/pi/.local/share/applications/dmrgateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild DMRGateway
GenericName=Rebuild DMRGateway
Exec=/usr/local/share/scripts/rebuild/rebuild_dmrgateway.sh
Icon=
Terminal=true
Categories=DMR;
EOL
