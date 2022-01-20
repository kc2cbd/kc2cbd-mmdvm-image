#!/bin/bash

#Create DStarRepeater Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/dstarrepeater_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DStarRepeater Start
GenericName=DStarRepeater Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/dstarrepeaterd /usr/local/etc/MMDVMConf/dstarrepeater"
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DStarRepeater Stop
GenericName=DStarRepeater Stop
Exec=gksudo pkill -f /usr/local/bin/dstarrepeaterd
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DStarRepeater Background Service Console
GenericName=DStarRepeater Background Service Console
Exec=screen -r dstarrepeaterd
Icon=
Terminal=true
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DStarRepeater Background Service Start
GenericName=DStarRepeater Background Service Start
Exec=sudo systemctl start dstarrepeater.service
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DStarRepeater Background Service Stop
GenericName=DStarRepeater Background Service Stop
Exec=sudo systemctl stop dstarrepeater.service
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DStarRepeater Background Service Restart
GenericName=DStarRepeater Background Service Restart
Exec=sudo systemctl restart dstarrepeater.service
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update DStarRepeater
GenericName=Update DStarRepeater
Exec=/usr/local/share/scripts/update/update_dstarrepeater.sh
Icon=
Terminal=true
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/edit_dstarrepeaterini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DStarRepeater Configuration
GenericName=Edit DStarRepeater Configuration
Exec=gksudo /usr/local/bin/dstarrepeaterconfig
Icon=
Terminal=false
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DStarRepeater Configuration
GenericName=Reset DStarRepeater Configuration
Exec=/usr/local/share/scripts/reset/reset_dstarrepeater_ini.sh
Icon=
Terminal=true
Categories=DStar;
EOL

cat > /home/pi/.local/share/applications/dstarrepeater_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild DStarRepeater
GenericName=Rebuild DStarRepeater
Exec=/usr/local/share/scripts/rebuild/rebuild_dstarrepeater.sh
Icon=
Terminal=true
Categories=DStar;
EOL
