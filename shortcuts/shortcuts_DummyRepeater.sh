#!/bin/bash

#Create DummyRepeater Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/dummyrepeater_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DummyRepeater Start
GenericName=DummyRepeater Start
Exec=lxterminal --working-directory="/usr/local/bin" --command="/usr/local/bin/DummyRepeater /usr/local/etc/MMDVMConf/DummyRepeater.ini"
Icon=
Terminal=false
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DummyRepeater Stop
GenericName=DummyRepeater Stop
Exec=gksudo pkill -f /usr/local/bin/DummyRepeater
Icon=
Terminal=false
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_service_console.desktop << EOL
[Desktop Entry]
Type=Application
Name=DummyRepeater Background Service Console
GenericName=DummyRepeater Background Service Console
Exec=screen -r DummyRepeater
Icon=
Terminal=true
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_service_start.desktop << EOL
[Desktop Entry]
Type=Application
Name=DummyRepeater Background Service Start
GenericName=DummyRepeater Background Service Start
Exec=sudo systemctl start dummyrepeater.service
Icon=
Terminal=false
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_service_stop.desktop << EOL
[Desktop Entry]
Type=Application
Name=DummyRepeater Background Service Stop
GenericName=DummyRepeater Background Service Stop
Exec=sudo systemctl stop dummyrepeater.service
Icon=
Terminal=false
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_service_restart.desktop << EOL
[Desktop Entry]
Type=Application
Name=DummyRepeater Background Service Restart
GenericName=DummyRepeater Background Service Restart
Exec=sudo systemctl restart dummyrepeater.service
Icon=
Terminal=false
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_update.desktop << EOL
[Desktop Entry]
Type=Application
Name=Update DummyRepeater
GenericName=Update DummyRepeater
Exec=/usr/local/share/scripts/update/update_dummyrepeater.sh
Icon=
Terminal=true
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/edit_dummyrepeater.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit DummyRepeater.ini
GenericName=Edit DummyRepeater.ini
Exec=geany /usr/local/etc/MMDVMConf/DummyRepeater.ini
Icon=
Terminal=false
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/dummyrepeater_resetini.desktop << EOL
[Desktop Entry]
Type=Application
Name=Reset DummyRepeater.ini
GenericName=Reset DummyRepeater.ini
Exec=/usr/local/share/scripts/reset/reset_dummyrepeater_ini.sh
Icon=
Terminal=true
Categories=Repeater;
EOL

cat > /home/pi/.local/share/applications/applications/dummyrepeater_rebuild.desktop << EOL
[Desktop Entry]
Type=Application
Name=Rebuild DummyRepeater
GenericName=Rebuild DummyRepeater
Exec=/usr/local/share/scripts/rebuild/rebuild_dummyrepeater.sh
Icon=
Terminal=true
Categories=Repeater;
EOL
