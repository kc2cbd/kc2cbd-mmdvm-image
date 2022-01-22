#!/bin/bash

# Create YSFGateway Service File
cat > /lib/systemd/system/ysfgateway.service << EOL
[Unit]
Description=YSFGateway Service
After=syslog.target network.target

[Service]
User=mmdvm
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S YSFGateway -D -m /usr/local/bin/YSFClients /usr/local/etc/MMDVMConf/YSFGateway.ini
ExecStop=/usr/bin/screen -S YSFGateway -X quit
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/ysfgateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/ysfgateway.service
chmod 755 /lib/systemd/system/ysfgateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/ysfgateway.timer /etc/systemd/system/ysfgateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/ysfgateway.timer /etc/systemd/system/ysfgateway.timer
ln -s /lib/systemd/system/ysfgateway.service /etc/systemd/system/ysfgateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable ysfgateway.timer
