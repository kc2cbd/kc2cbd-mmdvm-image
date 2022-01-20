#!/bin/bash

#Create ircDDBGateway Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/ircddbgateway_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDBGateway Start
GenericName=ircDDBGateway Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/ircDDBGateway /usr/local/etc/MMDVMConf/ircDDBGateway.ini"
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDBGateway Stop
GenericName=ircDDBGateway Stop
Exec=gksudo pkill -f /usr/local/bin/ircDDBGateway
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDBGateway Background Service Console
GenericName=ircDDBGateway Background Service Console
Exec=screen -r ircDDBGateway
Icon=
Terminal=true
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDBGateway Background Service Start
GenericName=ircDDBGateway Background Service Start
Exec=sudo systemctl start ircddbgateway.service
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDBGateway Background Service Stop
GenericName=ircDDBGateway Background Service Stop
Exec=sudo systemctl stop ircddbgateway.service
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=ircDDBGateway Background Service Restart
GenericName=ircDDBGateway Background Service Restart
Exec=sudo systemctl restart ircddbgateway.service
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update ircDDBGateway
GenericName=Update ircDDBGateway
Exec=/usr/local/share/scripts/update/update_ircddbgateway.sh
Icon=
Terminal=true
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/edit_ircddbgateway.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit ircDDBGateway.ini
GenericName=Edit ircDDBGateway.ini
Exec=sudo geany /usr/local/etc/MMDVMConf/ircDDBGateway
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset ircDDBGateway.ini
GenericName=Reset ircDDBGateway.ini
Exec=/usr/local/share/scripts/reset/reset_ircddbgateway_ini.sh
Icon=
Terminal=true
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/ircddbgateway_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild ircDDBGateway
GenericName=Rebuild ircDDBGateway
Exec=/usr/local/share/scripts/rebuild/rebuild_ircddbgateway.sh
Icon=
Terminal=true
Categories=DStar;
EOL
