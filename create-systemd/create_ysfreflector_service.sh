#!/bin/bash

# Create YSFGateway Service File
cat > /lib/systemd/system/ysfgateway.service << EOL
[Unit]
Description=YSFReflector Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S YSFReflector -D -m /usr/local/bin/YSFReflector /usr/local/etc/MMDVMConf/YSFReflector.ini
ExecStop=/usr/bin/screen -S YSFReflector -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/ysfreflector.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/ysfreflector.service
chmod 755 /lib/systemd/system/ysfreflector.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/ysfreflector.timer /etc/systemd/system/ysfreflector.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/ysfreflector.timer /etc/systemd/system/ysfreflector.timer
ln -s /lib/systemd/system/ysfreflector.service /etc/systemd/system/ysfreflector.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable ysfreflector.timer
