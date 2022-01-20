#!/bin/bash

# Create DAPNETGateway Service File
cat > /lib/systemd/system/dapnetgateway.service << EOL
[Unit]
Description=DAPNETGateway Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DAPNETGateway -D -m /usr/local/bin/DAPNETGateway /usr/local/etc/MMDVMConf/DAPNETGateway.ini
ExecStop=/usr/bin/screen -S DAPNETGateway -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/dapnetgateway.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/dapnetgateway.service
chmod 755 /lib/systemd/system/dapnetgateway.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/dapnetgateway.timer /etc/systemd/system/dapnetgateway.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/dapnetgateway.timer /etc/systemd/system/dapnetgateway.timer
ln -s /lib/systemd/system/dapnetgateway.service /etc/systemd/system/dapnetgateway.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
systemctl enable dapnetgateway.timer
