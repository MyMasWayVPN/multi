#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
AKUN="AKUN SSH"
TIMES="10"
CHATID="$(cat /root/id/telegram | grep -w "ID" | cut -d: -f2|sed 's/ //g')"
KEY="$(cat /root/id/telegram | grep -w "KEY" | cut -d= -f2|sed 's/ //g')"
URL="https://api.telegram.org/bot$KEY/sendMessage"
colornow=$(cat /etc/mwstore/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/mwstore/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/mwstore/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

function addssh(){
clear
dnsdomain=$(cat /etc/xray/dns)
dnskey=$(cat /etc/slowdns/server.pub)
domen=`cat /etc/xray/domain`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "   Username    : " Login
read -p "   Owner       : " OWNER
#read -p "   Id Telegram : " CHATIDGC
CEKFILE=/etc/xray/ssh.txt
if [ -f "$CEKFILE" ]; then
file001="OK"
else
touch /etc/xray/ssh.txt
fi

if grep -qw "$Login" /etc/xray/ssh.txt; then
echo -e "$COLOR1│${NC}  [Error] Username \e[31m$Login\e[0m already exist"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-ssh
else
echo "$Login" >> /etc/xray/ssh.txt
fi

if [ -z $Login ]; then
echo -e "$COLOR1│${NC} [Error] Username cannot be empty "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "    Press any key to back on menu"
menu-ssh
fi

read -p "   Password   : " Pass
if [ -z $Pass ]; then
echo -e "$COLOR1│${NC}  [Error] Password cannot be empty "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
fi
read -p "   Expired (hari): " masaaktif
if [ -z $masaaktif ]; then
echo -e "$COLOR1│${NC}  [Error] EXP Date cannot be empty "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-ssh
fi

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
portntls=`cat /root/log-install.txt | grep -w "SSH NON-SSL Websocket" | cut -f2 -d:`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dnsdomain=$(cat /etc/xray/dns)
dnskey=$(cat /etc/slowdns/server.pub)
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
exp2=`date -d "$masaaktif days" +"%Y-%m-%d"`
#####BOT-TRX
TRX="
<code>Transaksi Berhasil</code>
<code>────────────────────</code>
<b>  ⚠️TRANSAKSI SSH OVPN⚠️      </b>
<code>────────────────────</code>
<b>🌟Owner   :</b> <code>$OWNER</code>
<b>🌟Detail  :</b> <code>$AKUN</code>
<b>🌟Durasi  :</b> <code>$exp</code>
<b>🌟Server  :</b> <code>$domen</code>
<code>────────────────────</code>
<i>Notifikasi Via MasWayBOT</i>
<b>Tele : @maswayvpn</b>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TRX&parse_mode=html" $URL
clear
###########
cat > /home/vps/public_html/user-ssh/ssh-$Login.txt <<END
============================
    Detail SSH & UDP  
============================
  Username   : $Login
  Password   : $Pass
  Expired On : $exp
============================
  IP         : $IP
  Host       : $domen
  OpenSSH    : $opensh
  Dropbear   : $db
  SSH-WS     :$portntls
  SSH-UDP    : 1-65535
  SSH-SSL-WS : $wsssl
  SSL/TLS    :$ssl
  UDPGW      : 7100-7300
============================
  GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]
============================
  GET wss://[host]/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]
============================
END
if [[ ! -z "${PID}" ]]; then
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│$NC  Username   : $Login" 
echo -e "$COLOR1│$NC  Password   : $Pass"
echo -e "$COLOR1│$NC  Expired On : $exp" 
echo ""
echo -e "$COLOR1 $NC  IP         : $IP" 
echo -e "$COLOR1 $NC  Host       : $domen" 
echo -e "$COLOR1 $NC  OpenSSH    : $opensh"
echo -e "$COLOR1 $NC  Dropbear   : $db" 
echo -e "$COLOR1 $NC  SSH-WS     :$portntls" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535"
echo -e "$COLOR1 $NC  SSH-SSL-WS : $wsssl" 
echo -e "$COLOR1 $NC  SSL/TLS    :$ssl" 
echo -e "$COLOR1 $NC  UDPGW      : 7100-7300" 
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET wss://[host]/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1 ${NC}  Link Detail Akun : http://$domen:81/user-ssh/ssh-$Login.txt"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
else
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│$NC  Username   : $Login" 
echo -e "$COLOR1│$NC  Password   : $Pass"
echo -e "$COLOR1│$NC  Expired On : $exp" 
echo ""
echo -e "$COLOR1 $NC  IP         : $IP" 
echo -e "$COLOR1 $NC  Host       : $domen" 
echo -e "$COLOR1 $NC  OpenSSH    : $opensh"
echo -e "$COLOR1 $NC  Dropbear   : $db" 
echo -e "$COLOR1 $NC  SSH-WS     :$portntls" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535"
echo -e "$COLOR1 $NC  SSH-SSL-WS : $wsssl" 
echo -e "$COLOR1 $NC  SSL/TLS    :$ssl" 
echo -e "$COLOR1 $NC  UDPGW      : 7100-7300" 
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET wss://[host]/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1 ${NC}  Link Detail Akun : http://$domen:81/user-ssh/ssh-$Login.txt"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
fi
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-ssh
}
function sshwss(){
    clear
portdb=`cat ~/log-install.txt | grep -w "Dropbear" | cut -d: -f2|sed 's/ //g' | cut -f2 -d","`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
if [ -f "/etc/systemd/system/sshws.service" ]; then
clear
else
wget -q -O /usr/bin/proxy3.js "https://raw.githubusercontent.com/mymaswayvpn/multi/main/ssh/proxy3.js"
cat <<EOF > /etc/systemd/system/sshws.service
[Unit]
Description=WSenabler
Documentation=https://MasWaySTORE.MY.ID

[Service]
Type=simple
ExecStart=/usr/bin/ssh-wsenabler
KillMode=process
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
EOF

fi

function start() {
        clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • WEBSOCKET MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" 
wget -q -O /usr/bin/ssh-wsenabler "https://raw.githubusercontent.com/mymaswayvpn/multi/main/ssh/sshws-true.sh" && chmod +x /usr/bin/ssh-wsenabler
systemctl daemon-reload >/dev/null 2>&1
systemctl enable sshws.service >/dev/null 2>&1
systemctl start sshws.service >/dev/null 2>&1
sed -i "/SSH Websocket/c\   - SSH Websocket           : $portsshws [ON]" /root/log-install.txt
echo -e "$COLOR1│${NC}  [INFO] • ${green}SSH Websocket Started${NC}"
echo -e "$COLOR1│${NC}  [INFO] • Restart is require for Changes"
echo -e "$COLOR1│${NC}           to take effect"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
sshwss 
}

function stop() {
        clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • WEBSOCKET MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" 
systemctl stop sshws.service >/dev/null 2>&1
tmux kill-session -t sshws >/dev/null 2>&1
sed -i "/SSH Websocket/c\   - SSH Websocket           : $portsshws [OFF]" /root/log-install.txt
echo -e "$COLOR1│${NC}  [INFO] • ${red}SSH Websocket Stopped${NC}"
echo -e "$COLOR1│${NC}  [INFO] • Restart is require for Changes"
echo -e "$COLOR1│${NC}           to take effect"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
sshwss 
}

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • WEBSOCKET MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
if [[ ! -z "${PID}" ]]; then
echo -e "$COLOR1│$NC   • Websocket Is ${COLOR1}Running$NC"
else
echo -e "$COLOR1│$NC   • Websocket Is ${red}Not Running$NC"
fi
echo -e "$COLOR1│$NC"  
echo -e "$COLOR1│$NC   ${COLOR1}[01]${NC} • Enable SSH WS   ${COLOR1}[02]${NC} • Disable SSH WS"
echo -e "$COLOR1│$NC"  
echo -e "$COLOR1│$NC   ${COLOR1}[00]${NC} • GO BACK"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; start ;;
02 | 2) clear ; stop ;;
00 | 0) clear ; menu ;;
*) clear ; menu-set ;;
esac
}
function cekssh(){

clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}              • SSH ACTIVE USERS •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e ""

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
               
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi

done
echo " "
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi


done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
        echo " "

        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
        echo " "

        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi


rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo "";
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}

function delssh(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}              • SSH DELETE USERS •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "   Username : " Pengguna

if [ -z $Pengguna ]; then
echo -e "   [Error] Username cannot be empty "
else
if getent passwd $Pengguna > /dev/null 2>&1; then
userdel $Pengguna > /dev/null 2>&1
sed -i "s/$Pengguna//g" /etc/xray/ssh.txt
echo -e "   [INFO] User $Pengguna was removed."
else
echo -e "   [INFO] Failure: User $Pengguna Not Exist."
fi
fi
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}

function renewssh(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW SSH ACCOUNT •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "   Username : " User

if getent passwd $User > /dev/null 2>&1; then
ok="ok"
else
echo -e "$COLOR1│${NC}   [INFO] Failure: User $User Not Exist."
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi

if [ -z $User ]; then
echo -e "$COLOR1│${NC}   [Error] Username cannot be empty "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi

egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
if [ -z $Days ]; then
Days="1"
fi
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW SSH ACCOUNT •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "   Username   : $User"
echo -e "   Days Added : $Days Days"
echo -e "   Expires on : $Expiration_Display"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
else
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW SSH ACCOUNT •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "   Username Doesnt Exist      "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
fi
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}


function memberssh(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW SSH ACCOUNT •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"    
echo "   USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"  
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "   • $AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "   • $AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"  
echo "   Total: $JUMLAH User"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}

function trialssh(){
clear
domen=`cat /etc/xray/domain`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
portntls=`cat /root/log-install.txt | grep -w "SSH NON-SSL Websocket" | cut -f2 -d:`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
clear
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
dnsdomain=$(cat /etc/xray/dns)
dnskey=$(cat /etc/slowdns/server.pub)


Login=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="30"
Pass=1
echo Ping Host &> /dev/null
echo Create Akun: $Login &> /dev/null
sleep 0.5
echo Setting Password: $Pass &> /dev/null
sleep 0.5
clear
now='date -d "30 minutes" +"%H:%M"'
useradd -e `$now` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│$NC  Username   : $Login" 
echo -e "$COLOR1│$NC  Password   : $Pass"
echo -e "$COLOR1│$NC  Expired On : $exp" 
echo ""
echo -e "$COLOR1 $NC  IP         : $IP" 
echo -e "$COLOR1 $NC  Host       : $domen" 
echo -e "$COLOR1 $NC  OpenSSH    : $opensh"
echo -e "$COLOR1 $NC  Dropbear   : $db" 
echo -e "$COLOR1 $NC  SSH-WS     :$portntls" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535"
echo -e "$COLOR1 $NC  SSH-SSL-WS : $wsssl" 
echo -e "$COLOR1 $NC  SSL/TLS    :$ssl" 
echo -e "$COLOR1 $NC  UDPGW      : 7100-7300" 
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET wss://[host]/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1 ${NC}  Link Detail Akun : http://$domen:81/user-ssh/ssh-$Login.txt"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"

else

echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1│$NC  Username   : $Login" 
echo -e "$COLOR1│$NC  Password   : $Pass"
echo -e "$COLOR1│$NC  Expired On : $exp" 
echo ""
echo -e "$COLOR1 $NC  IP         : $IP" 
echo -e "$COLOR1 $NC  Host       : $domen" 
echo -e "$COLOR1 $NC  OpenSSH    : $opensh"
echo -e "$COLOR1 $NC  Dropbear   : $db" 
echo -e "$COLOR1 $NC  SSH-WS     :$portntls" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535" 
echo -e "$COLOR1 $NC  SSH-UDP    : 1-65535"
echo -e "$COLOR1 $NC  SSH-SSL-WS : $wsssl" 
echo -e "$COLOR1 $NC  SSL/TLS    :$ssl" 
echo -e "$COLOR1 $NC  UDPGW      : 7100-7300" 
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "  GET wss://[host]/ HTTP/1.1[crlf]Host: bug.com[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1 ${NC}  Link Detail Akun : http://$domen:81/user-ssh/ssh-$Login.txt"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
fi
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="MasWaySTORE"

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $3}')
fi
Domen="$(cat /etc/xray/domain)"
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $2}')
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "  $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
clear
echo -e "$COLOR1  ╔═════════════════════════════╦═══════════════════════════════╗"
echo -e "$COLOR1  ║ $NC$COLBG1                       ✶ SSH MENU ✶                        $COLOR1 ║"
echo -e "$COLOR1  ║-----------------------------║-------------------------------║"
echo -e "$COLOR1  ╠➣$NC 1. ADD SSH                 $COLOR1╠➣$NC 4. DELETE SSH                $COLOR1║ "
echo -e "$COLOR1  ╠➣$NC 2. TRIAL SSH               $COLOR1╠➣$NC 5. LIST USER                 $COLOR1║ "
echo -e "$COLOR1  ╠➣$NC 3. RENEW SSH               $COLOR1╠➣$NC 6. USER ONLINE               $COLOR1║ "
echo -e "$COLOR1  ║                             $COLOR1╠➣$NC 00. Back To Menu          $COLOR1   ║ "
echo -e "$COLOR1  ║-----------------------------║-------------------------------║"
echo -e "$COLOR1  ╚═════════════════════════════╩═══════════════════════════════╝$NC"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; addssh ;;
02 | 2) clear ; trialssh ;;
03 | 3) clear ; renewssh ;;
#04 | 4) clear ; sshwss ;;
04 | 4) clear ; delssh ;;
05 | 5) clear ; memberssh ;;
06 | 6) clear ; cekssh ;;
00 | 0) clear ; menu ;;
*) clear ; menu-ssh ;;
esac

       
