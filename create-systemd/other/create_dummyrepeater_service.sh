#!/bin/bash

# Create DummyRepeater Service File
cat > /lib/systemd/system/dummyrepeater.service << EOL
[Unit]
Description=DummyRepeater Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DummyRepeater -D -m /usr/local/bin/DummyRepeater /usr/local/etc/MMDVMConf/DummyRepeater.ini
ExecStop=/usr/bin/screen -S DummyRepeater -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/dummyrepeater.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/dummyrepeater.service
chmod 755 /lib/systemd/system/dummyrepeater.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/dummyrepeater.timer /etc/systemd/system/dummyrepeater.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/dummyrepeater.timer /etc/systemd/system/dummyrepeater.timer
ln -s /lib/systemd/system/dummyrepeater.service /etc/systemd/system/dummyrepeater.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable dummyrepeater.timer
