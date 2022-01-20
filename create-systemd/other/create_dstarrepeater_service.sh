#!/bin/bash

# Create DStarRepeater Service File
cat > /lib/systemd/system/dstarrepeater.service << EOL
[Unit]
Description=DStarRepeater Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S dstarrepeaterd -D -m /usr/local/bin/dstarrepeaterd /usr/local/etc/MMDVMConf/dstarrepeater
ExecStop=/usr/bin/screen -S dstarrepeaterd -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/dstarrepeater.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/dstarrepeater.service
chmod 755 /lib/systemd/system/dstarrepeater.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/dstarrepeater.timer /etc/systemd/system/dstarrepeater.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/dstarrepeater.timer /etc/systemd/system/dstarrepeater.timer
ln -s /lib/systemd/system/dstarrepeater.service /etc/systemd/system/dstarrepeater.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable dstarrepeater.timer
