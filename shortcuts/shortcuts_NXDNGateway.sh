#!/bin/bash

#Create NXDNGateway Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/nxdngateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDNGateway Start
GenericName=NXDNGateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/NXDNGateway /usr/local/etc/MMDVMConf/NXDNGateway.ini"
Icon=
Terminal=false
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDNGateway Stop
GenericName=NXDNGateway Stop
Exec=gksudo pkill -f /usr/local/bin/NXDNGateway
Icon=
Terminal=false
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDNGateway Background Service Console
GenericName=NXDNGateway Background Service Console
Exec=screen -r NXDNGateway
Icon=
Terminal=true
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDNGateway Background Service Start
GenericName=NXDNGateway Background Service Start
Exec=sudo systemctl start nxdngateway.service
Icon=
Terminal=false
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDNGateway Background Service Stop
GenericName=NXDNGateway Background Service Stop
Exec=sudo systemctl stop nxdngateway.service
Icon=
Terminal=false
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=NXDNGateway Background Service Restart
GenericName=NXDNGateway Background Service Restart
Exec=sudo systemctl restart nxdngateway.service
Icon=
Terminal=false
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update NXDNGateway
GenericName=Update NXDNGateway
Exec=/usr/local/share/scripts/update/update_nxdngateway.sh
Icon=
Terminal=true
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/edit_nxdngateway.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit NXDNGateway.ini
GenericName=Edit NXDNGateway.ini
Exec=geany /usr/local/etc/MMDVMConf/NXDNGateway.ini
Icon=
Terminal=false
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset NXDNGateway.ini
GenericName=Reset NXDNGateway.ini
Exec=/usr/local/share/scripts/reset/reset_nxdngateway_ini.sh
Icon=
Terminal=true
Categories=NXDN;
EOL

cat > /home/pi/.local/share/applications/nxdngateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild NXDNGateway
GenericName=Rebuild NXDNGateway
Exec=/usr/local/share/scripts/rebuild/rebuild_nxdngateway.sh
Icon=
Terminal=true
Categories=NXDN;
EOL
