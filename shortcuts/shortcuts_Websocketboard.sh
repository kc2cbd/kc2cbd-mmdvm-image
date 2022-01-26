#!/bin/bash

#Create MMDVMHost Shortcuts in Amateur Radio Menu
cat > /home/pi/.local/share/applications/open_Websocketboard_dashboard.desktop << EOL
[Desktop Entry]
Type=Application
Name=Open Dashboard
GenericName=Open Dashboard
Exec=chromium-browser localhost:8000
Icon=
Terminal=false
Categories=Dashboard;
EOL

cat > /home/pi/.local/share/applications/edit_logtailer_setup.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit logtailer
GenericName=Edit logtailer
Exec=sudo geany /opt/MMDVMDash/logtailer.ini
Icon=
Terminal=false
Categories=Dashboard;
EOL

cat > /home/pi/.local/share/applications/edit_config-js_setup.desktop << EOL
[Desktop Entry]
Type=Application
Name=Edit config.js
GenericName=Edit config.js
Exec=sudo geany /opt/MMDVMDash/html/js/config.js
Icon=
Terminal=false
Categories=Dashboard;
EOL

cat > /home/pi/.local/share/applications/restart_websocketboard_service.desktop << EOL
[Desktop Entry]
Type=Application
Name=Restart Dashboard Service
GenericName=Restart Dashboard Service
Exec=sudo systemctl restart http.server.service && sudo systemctl restart logtailer.service
Icon=
Terminal=false
Categories=Dashboard;
EOL
