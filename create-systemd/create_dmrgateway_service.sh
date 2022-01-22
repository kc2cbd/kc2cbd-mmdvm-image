#!/bin/bash

# Create DMRGateway Service File
cat > /lib/systemd/system/dmrgateway.service << EOL
[Unit]
Description=DMRGateway Service
After=syslog.target network.target

[Service]
User=mmdvm
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DMRGateway -D -m /usr/local/bin/DMRGateway /usr/local/etc/MMDVMConf/DMRGateway.ini
ExecStop=/usr/bin/screen -S DMRGateway -X quit
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/dmrgateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/dmrgateway.service
chmod 755 /lib/systemd/system/dmrgateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/dmrgateway.timer /etc/systemd/system/dmrgateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/dmrgateway.timer /etc/systemd/system/dmrgateway.timer
ln -s /lib/systemd/system/dmrgateway.service /etc/systemd/system/dmrgateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable dmrgateway.timer
systemctl enable dmrgateway.service
