#!/bin/bash

# Create FMRepeater Service File
cat > /lib/systemd/system/fmrepeater.service << EOL
[Unit]
Description=FMRepeater Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S FMRepeater -D -m /usr/local/bin/FMRepeater /usr/local/etc/MMDVMConf/FMRepeater.ini
ExecStop=/usr/bin/screen -S FMRepeater -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/fmrepeater.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/fmrepeater.service
chmod 755 /lib/systemd/system/fmrepeater.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/fmrepeater.timer /etc/systemd/system/fmrepeater.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/fmrepeater.timer /etc/systemd/system/fmrepeater.timer
ln -s /lib/systemd/system/fmrepeater.service /etc/systemd/system/fmrepeater.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable fmrepeater.timer
systemctl mask fmrepeater.service
