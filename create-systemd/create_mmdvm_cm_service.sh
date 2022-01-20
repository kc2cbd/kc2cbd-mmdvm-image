#!/bin/bash

# Create DMR2M17 Service File
cat > /lib/systemd/system/DMR2M17.service << EOL
[Unit]
Description=DMR2M17 Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DMR2M17 -D -m /usr/local/bin/DMR2M17 /usr/local/etc/MMDVMConf/DMR2M17.ini
ExecStop=/usr/bin/screen -S DMR2M17 -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/DMR2M17.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/DMR2M17.service
chmod 755 /lib/systemd/system/DMR2M17.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/DMR2M17.timer /etc/systemd/system/DMR2M17.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/DMR2M17.timer /etc/systemd/system/DMR2M17.timer
ln -s /lib/systemd/system/DMR2M17.service /etc/systemd/system/DMR2M17.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable DMR2M17.timer

# Create DMR2NXDN Service File
cat > /lib/systemd/system/DMR2NXDN.service << EOL
[Unit]
Description=DMR2NXDN Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DMR2NXDN -D -m /usr/local/bin/DMR2NXDN /usr/local/etc/MMDVMConf/DMR2NXDN.ini
ExecStop=/usr/bin/screen -S DMR2NXDN -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/DMR2NXDN.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/DMR2NXDN.service
chmod 755 /lib/systemd/system/DMR2NXDN.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/DMR2NXDN.timer /etc/systemd/system/DMR2NXDN.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/DMR2NXDN.timer /etc/systemd/system/DMR2NXDN.timer
ln -s /lib/systemd/system/DMR2NXDN.service /etc/systemd/system/DMR2NXDN.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable DMR2NXDN.timer

# Create DMR2P25 Service File
cat > /lib/systemd/system/DMR2P25.service << EOL
[Unit]
Description=DMR2P25 Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DMR2P25 -D -m /usr/local/bin/DMR2P25 /usr/local/etc/MMDVMConf/DMR2P25.ini
ExecStop=/usr/bin/screen -S DMR2P25 -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/DMR2P25.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/DMR2P25.service
chmod 755 /lib/systemd/system/DMR2P25.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/DMR2P25.timer /etc/systemd/system/DMR2P25.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/DMR2P25.timer /etc/systemd/system/DMR2P25.timer
ln -s /lib/systemd/system/DMR2P25.service /etc/systemd/system/DMR2P25.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable DMR2P25.timer

# Create DMR2YSF Service File
cat > /lib/systemd/system/DMR2YSF.service << EOL
[Unit]
Description=DMR2YSF Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S DMR2YSF -D -m /usr/local/bin/DMR2YSF /usr/local/etc/MMDVMConf/DMR2YSF.ini
ExecStop=/usr/bin/screen -S DMR2YSF -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/DMR2YSF.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/DMR2YSF.service
chmod 755 /lib/systemd/system/DMR2YSF.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/DMR2YSF.timer /etc/systemd/system/DMR2YSF.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/DMR2YSF.timer /etc/systemd/system/DMR2YSF.timer
ln -s /lib/systemd/system/DMR2YSF.service /etc/systemd/system/DMR2YSF.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable DMR2YSF.timer

# Create M172DMR Service File
cat > /lib/systemd/system/M172DMR.service << EOL
[Unit]
Description=M172DMR Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S M172DMR -D -m /usr/local/bin/M172DMR /usr/local/etc/MMDVMConf/M172DMR.ini
ExecStop=/usr/bin/screen -S M172DMR -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/M172DMR.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/M172DMR.service
chmod 755 /lib/systemd/system/M172DMR.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/M172DMR.timer /etc/systemd/system/M172DMR.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/M172DMR.timer /etc/systemd/system/M172DMR.timer
ln -s /lib/systemd/system/M172DMR.service /etc/systemd/system/M172DMR.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable M172DMR.timer

# Create M172YSF Service File
cat > /lib/systemd/system/M172YSF.service << EOL
[Unit]
Description=M172YSF Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S M172YSF -D -m /usr/local/bin/M172YSF /usr/local/etc/MMDVMConf/M172YSF.ini
ExecStop=/usr/bin/screen -S M172YSF -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/M172YSF.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/M172YSF.service
chmod 755 /lib/systemd/system/M172YSF.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/M172YSF.timer /etc/systemd/system/M172YSF.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/M172YSF.timer /etc/systemd/system/M172YSF.timer
ln -s /lib/systemd/system/M172YSF.service /etc/systemd/system/M172YSF.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable M172YSF.timer

# Create NXDN2DMR Service File
cat > /lib/systemd/system/NXDN2DMR.service << EOL
[Unit]
Description=NXDN2DMR Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S NXDN2DMR -D -m /usr/local/bin/NXDN2DMR /usr/local/etc/MMDVMConf/NXDN2DMR.ini
ExecStop=/usr/bin/screen -S NXDN2DMR -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/NXDN2DMR.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/NXDN2DMR.service
chmod 755 /lib/systemd/system/NXDN2DMR.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/NXDN2DMR.timer /etc/systemd/system/NXDN2DMR.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/NXDN2DMR.timer /etc/systemd/system/NXDN2DMR.timer
ln -s /lib/systemd/system/NXDN2DMR.service /etc/systemd/system/NXDN2DMR.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable NXDN2DMR.timer

# Create P252DMR Service File
cat > /lib/systemd/system/P252DMR.service << EOL
[Unit]
Description=P252DMR Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S P252DMR -D -m /usr/local/bin/P252DMR /usr/local/etc/MMDVMConf/P252DMR.ini
ExecStop=/usr/bin/screen -S P252DMR -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/P252DMR.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/P252DMR.service
chmod 755 /lib/systemd/system/P252DMR.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/P252DMR.timer /etc/systemd/system/P252DMR.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/P252DMR.timer /etc/systemd/system/P252DMR.timer
ln -s /lib/systemd/system/P252DMR.service /etc/systemd/system/P252DMR.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable P252DMR.timer

# Create USRP2DMR Service File
cat > /lib/systemd/system/USRP2DMR.service << EOL
[Unit]
Description=USRP2DMR Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S USRP2DMR -D -m /usr/local/bin/USRP2DMR /usr/local/etc/MMDVMConf/USRP2DMR.ini
ExecStop=/usr/bin/screen -S USRP2DMR -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/USRP2DMR.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/USRP2DMR.service
chmod 755 /lib/systemd/system/USRP2DMR.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/USRP2DMR.timer /etc/systemd/system/USRP2DMR.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/USRP2DMR.timer /etc/systemd/system/USRP2DMR.timer
ln -s /lib/systemd/system/USRP2DMR.service /etc/systemd/system/USRP2DMR.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable USRP2DMR.timer

# Create USRP2M17 Service File
cat > /lib/systemd/system/USRP2M17.service << EOL
[Unit]
Description=USRP2M17 Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S USRP2M17 -D -m /usr/local/bin/USRP2M17 /usr/local/etc/MMDVMConf/USRP2M17.ini
ExecStop=/usr/bin/screen -S USRP2M17 -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/USRP2M17.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/USRP2M17.service
chmod 755 /lib/systemd/system/USRP2M17.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/USRP2M17.timer /etc/systemd/system/USRP2M17.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/USRP2M17.timer /etc/systemd/system/USRP2M17.timer
ln -s /lib/systemd/system/USRP2M17.service /etc/systemd/system/USRP2M17.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable USRP2M17.timer

# Create USRP2P25 Service File
cat > /lib/systemd/system/USRP2P25.service << EOL
[Unit]
Description=USRP2P25 Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S USRP2P25 -D -m /usr/local/bin/USRP2P25 /usr/local/etc/MMDVMConf/USRP2P25.ini
ExecStop=/usr/bin/screen -S USRP2P25 -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/USRP2P25.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/USRP2P25.service
chmod 755 /lib/systemd/system/USRP2P25.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/USRP2P25.timer /etc/systemd/system/USRP2P25.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/USRP2P25.timer /etc/systemd/system/USRP2P25.timer
ln -s /lib/systemd/system/USRP2P25.service /etc/systemd/system/USRP2P25.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable USRP2P25.timer

# Create USRP2YSF Service File
cat > /lib/systemd/system/USRP2YSF.service << EOL
[Unit]
Description=USRP2YSF Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S USRP2YSF -D -m /usr/local/bin/USRP2YSF /usr/local/etc/MMDVMConf/USRP2YSF.ini
ExecStop=/usr/bin/screen -S USRP2YSF -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/USRP2YSF.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/USRP2YSF.service
chmod 755 /lib/systemd/system/USRP2YSF.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/USRP2YSF.timer /etc/systemd/system/USRP2YSF.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/USRP2YSF.timer /etc/systemd/system/USRP2YSF.timer
ln -s /lib/systemd/system/USRP2YSF.service /etc/systemd/system/USRP2P25.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable USRP2YSF.timer

# Create YSF2DMR Service File
cat > /lib/systemd/system/YSF2DMR.service << EOL
[Unit]
Description=YSF2DMR Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S YSF2DMR -D -m /usr/local/bin/YSF2DMR /usr/local/etc/MMDVMConf/YSF2DMR.ini
ExecStop=/usr/bin/screen -S YSF2DMR -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/YSF2DMR.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/YSF2DMR.service
chmod 755 /lib/systemd/system/YSF2DMR.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/YSF2DMR.timer /etc/systemd/system/YSF2DMR.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/YSF2DMR.timer /etc/systemd/system/YSF2DMR.timer
ln -s /lib/systemd/system/YSF2DMR.service /etc/systemd/system/YSF2DMR.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable YSF2DMR.timer

# Create YSF2NXDN Service File
cat > /lib/systemd/system/YSF2NXDN.service << EOL
[Unit]
Description=YSF2NXDN Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S YSF2NXDN -D -m /usr/local/bin/YSF2NXDN /usr/local/etc/MMDVMConf/YSF2NXDN.ini
ExecStop=/usr/bin/screen -S YSF2NXDN -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/YSF2NXDN.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/YSF2NXDN.service
chmod 755 /lib/systemd/system/YSF2NXDN.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/YSF2NXDN.timer /etc/systemd/system/YSF2NXDN.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/YSF2NXDN.timer /etc/systemd/system/YSF2NXDN.timer
ln -s /lib/systemd/system/YSF2NXDN.service /etc/systemd/system/YSF2NXDN.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable YSF2NXDN.timer

# Create YSF2P25 Service File
cat > /lib/systemd/system/YSF2P25.service << EOL
[Unit]
Description=YSF2P25 Service
After=syslog.target network.target

[Service]
User=pi
WorkingDirectory=/usr/local/bin
ExecStart=/usr/bin/screen -S YSF2P25 -D -m /usr/local/bin/YSF2P25 /usr/local/etc/MMDVMConf/YSF2P25.ini
ExecStop=/usr/bin/screen -S YSF2P25 -X quit

[Install]
WantedBy=multi-user.target
EOL

# Create Timer - 2min Delay
cat > /lib/systemd/system/YSF2P25.timer << EOL
[Timer]
OnStartupSec=120

[Install]
WantedBy=multi-user.target
EOL

# Make Service and Timer Executable
chmod 755 /lib/systemd/system/YSF2P25.service
chmod 755 /lib/systemd/system/YSF2P25.timer
# Delete Old Symbolic Links for Service
rm -Rf /etc/systemd/system/YSF2P25.timer /etc/systemd/system/YSF2P25.service
# Create Symbolic Links for Service
ln -s /lib/systemd/system/YSF2P25.timer /etc/systemd/system/YSF2P25.timer
ln -s /lib/systemd/system/YSF2P25.service /etc/systemd/system/YSF2P25.service
# Pickup New Service and Enable Timer
systemctl daemon-reload
#systemctl enable YSF2P25.timer
