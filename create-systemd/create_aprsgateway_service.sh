#!/bin/bash

# Create APRSGateway Service File
cat > /lib/systemd/system/aprsgateway.service << EOL
[Unit]
Description=APRSGateway Service
After=syslog.target network.target

[Service]
User=mmdvm
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S APRSGateway -D -m /usr/local/bin/APRSGateway /usr/local/etc/MMDVMConf/APRSGateway.ini
ExecStop=/usr/bin/screen -S APRSGateway -X quit
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/aprsgateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/aprsgateway.service
chmod 755 /lib/systemd/system/aprsgateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/aprsgateway.timer /etc/systemd/system/aprsgateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/aprsgateway.timer /etc/systemd/system/aprsgateway.timer
ln -s /lib/systemd/system/aprsgateway.service /etc/systemd/system/aprsgateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable aprsgateway.timer
