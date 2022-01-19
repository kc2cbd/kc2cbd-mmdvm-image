#!/bin/bash

#Create MMDVMHost Shortcuts in Amateur Radio Menu
cat > /usr/share/applications/open_dashboard.desktop << EOL
[Desktop Entry]
Type=Application
Name=Open Dashboard
GenericName=Open Dashboard
Exec=chromium-browser localhost/index.php &
Icon=
Terminal=false
Categories=Dashboard;
EOL

cat > /usr/share/applications/remove_dashboard_setup.desktop << EOL
[Desktop Entry]
Type=Application
Name=Setup Dashboard
GenericName=Setup Dashboard
Exec=/usr/local/share/scripts/setup_dashboard_dg9vh.sh
Icon=
Terminal=false
Categories=Dashboard;
EOL

cat > /usr/share/applications/remove_dashboard_setup.desktop << EOL
[Desktop Entry]
Type=Application
Name=Remove Dashboard Setup
GenericName=Remove Dashboard Setup
Exec=/usr/local/share/scripts/remove_dashboard_setup.sh
Icon=
Terminal=false
Categories=Dashboard;
EOL
