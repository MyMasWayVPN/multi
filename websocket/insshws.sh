#!/bin/bash
# Proxy For WS
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
echo "Installing SSH Websocket by MasWayVPN" | lolcat
echo "Progress..." | lolcat
sleep 3
cd

wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/ws-stunnel
wget -O /usr/local/bin/ws-com https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/ws-com
wget -O /usr/local/bin/config.yml https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/config.yml

chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-com
chmod +x /usr/local/bin/config.yml

wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service
cat > /etc/systemd/system/ws-com.service <<EOF
[Unit]
Description=WebSocket Services
Documentation=https://autoscript.rasyacomputer.co.id
After=network.target nss-lookup.target
[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/ws-com -f /usr/local/bin/config.yml
Restart=on-failure
RestartPreventExitStatus=23
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
systemctl enable ws-com.service
systemctl start ws-com.service

