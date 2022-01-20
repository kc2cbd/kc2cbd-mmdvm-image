#!/bin/bash

#Create DAPNETGateway Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/dapnetgateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DAPNETGateway Start
GenericName=DAPNETGateway Start
Exec=lxterminal --working-directory="/usr/local/bin/" --command="/usr/local/bin/DAPNETGateway /usr/local/etc/MMDVMConf/DAPNETGateway.ini"
Icon=
Terminal=false
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DAPNETGateway Stop
GenericName=DAPNETGateway Stop
Exec=gksudo pkill -f /usr/local/bin/DAPNETGateway
Icon=
Terminal=false
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DAPNETGateway Background Service Console
GenericName=DAPNETGateway Background Service Console
Exec=screen -r DAPNETGateway
Icon=
Terminal=true
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DAPNETGateway Background Service Start
GenericName=DAPNETGateway Background Service Start
Exec=sudo systemctl start dapnetgateway.service
Icon=
Terminal=false
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DAPNETGateway Background Service Stop
GenericName=DAPNETGateway Background Service Stop
Exec=sudo systemctl stop dapnetgateway.service
Icon=
Terminal=false
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DAPNETGateway Background Service Restart
GenericName=DAPNETGateway Background Service Restart
Exec=sudo systemctl restart dapnetgateway.service
Icon=
Terminal=false
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update DAPNETGateway
GenericName=Update DAPNETGateway
Exec=/usr/local/share/scripts/update/update_dapnetgateway.sh
Icon=
Terminal=true
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/edit_dapnetgatewayini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DAPNETGateway.ini
GenericName=Edit DAPNETGateway.ini
Exec=geany /usr/local/etc/MMDVMConf/DAPNETGateway.ini
Icon=
Terminal=false
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DAPNETGateway.ini
GenericName=Reset DAPNETGateway.ini
Exec=/usr/local/share/scripts/reset/reset_dapnetgateway_ini.sh
Icon=
Terminal=true
Categories=DAPNET;
EOL

cat > /home/pi/.local/share/applications/dapnetgateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild DAPNETGateway
GenericName=Rebuild DAPNETGateway
Exec=/usr/local/share/scripts/rebuild/rebuild_dapnetgateway.sh
Icon=
Terminal=true
Categories=DAPNET;
EOL
