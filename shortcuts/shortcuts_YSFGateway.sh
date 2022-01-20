#!/bin/bash

#Create YSFGateway Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/ysfgateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSFGateway Start
GenericName=YSFGateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/YSFGateway /usr/local/etc/MMDVMConf/YSFGateway.ini"
Icon=
Terminal=false
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSFGateway Stop
GenericName=YSFGateway Stop
Exec=gksudo pkill -f /usr/local/bin/YSFGateway
Icon=
Terminal=false
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSFGateway Background Service Console
GenericName=YSFGateway Background Service Console
Exec=screen -r YSFGateway
Icon=
Terminal=true
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSFGateway Background Service Start
GenericName=YSFGateway Background Service Start
Exec=sudo systemctl start ysfgateway.service
Icon=
Terminal=false
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSFGateway Background Service Stop
GenericName=YSFGateway Background Service Stop
Exec=sudo systemctl stop ysfgateway.service
Icon=
Terminal=false
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=YSFGateway Background Service Restart
GenericName=YSFGateway Background Service Restart
Exec=sudo systemctl restart ysfgateway.service
Icon=
Terminal=false
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update YSFGateway
GenericName=Update YSFGateway
Exec=/usr/local/share/scripts/update/update_ysfgateway.sh
Icon=
Terminal=true
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/edit_ysfgateway.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit YSFGateway.ini
GenericName=Edit YSFGateway.ini
Exec=sudo geany /usr/local/etc/MMDVMConf/YSFGateway.ini
Icon=
Terminal=false
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset YSFGateway.ini
GenericName=Reset YSFGateway.ini
Exec=/usr/local/share/scripts/reset/reset_ysfgateway_ini.sh
Icon=
Terminal=true
Categories=YSF;
EOL

cat > /home/pi/.local/share/applications/ysfgateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild YSFGateway
GenericName=Rebuild YSFGateway
Exec=/usr/local/share/scripts/rebuild/rebuild_ysfgateway.sh
Icon=
Terminal=true
Categories=M17;
EOL
