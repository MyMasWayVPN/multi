#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/mwstore/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/mwstore/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/mwstore/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
# // Exporting Language to UTF-8
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



function status(){
clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='xray'
becek='XRAY'
else
rekk='v2ray'
becek='V2RAY'
fi

ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ONLINE${NC}"
else
ressh="${red}OFFLINE${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ONLINE${NC}"
else
resst="${red}OFFLINE${NC}"
fi
sshws=$(service ws-dropbear status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
rews="${green}ONLINE${NC}"
else
rews="${red}OFFLINE${NC}"
fi

sshws2=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws2" = "active" ]; then
rews2="${green}ONLINE${NC}"
else
rews2="${red}OFFLINE${NC}"
fi

db=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$db" = "active" ]; then
resdb="${green}ONLINE${NC}"
else
resdb="${red}OFFLINE${NC}"
fi

slow=$(service client-sldns status | grep active | cut -d ' ' $stat)
if [ "$slow" = "active" ]; then
reslow="${green}ONLINE${NC}"
else
reslow="${red}OFFLINE${NC}"
fi
 
v2r=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ONLINE${NC}"
else
resv2r="${red}OFFLINE${NC}"
fi
vles=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$vles" = "active" ]; then
resvles="${green}ONLINE${NC}"
else
resvles="${red}OFFLINE${NC}"
fi
trj=$(service $rekk status | grep active | cut -d ' ' $stat)
if [ "$trj" = "active" ]; then
restr="${green}ONLINE${NC}"
else
restr="${red}OFFLINE${NC}"
fi

ningx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ningx" = "active" ]; then
resnx="${green}ONLINE${NC}"
else
resnx="${red}OFFLINE${NC}"
fi

squid=$(service squid status | grep active | cut -d ' ' $stat)
if [ "$squid" = "active" ]; then
ressq="${green}ONLINE${NC}"
else
ressq="${red}OFFLINE${NC}"
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SERVER STATUS •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│${NC}  • SSH & VPN                        • $ressh"
echo -e " $COLOR1│${NC}  • SQUID                            • $ressq"
echo -e " $COLOR1│${NC}  • DROPBEAR                         • $resdb"
echo -e " $COLOR1│${NC}  • NGINX                            • $resnx"
echo -e " $COLOR1│${NC}  • SLOWDNS                          • $reslow"
echo -e " $COLOR1│${NC}  • WS DROPBEAR                      • $rews"
echo -e " $COLOR1│${NC}  • WS STUNNEL                       • $rews2"
echo -e " $COLOR1│${NC}  • STUNNEL                          • $resst"
echo -e " $COLOR1│${NC}  • XRAY-SS                          • $resv2r"
echo -e " $COLOR1│${NC}  • XRAY                             • $resv2r"
echo -e " $COLOR1│${NC}  • VLESS                            • $resvles"
echo -e " $COLOR1│${NC}  • TROJAN                           • $restr"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-set
}
function restart(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SERVER STATUS •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
systemctl daemon-reload
echo -e " $COLOR1│${NC}  [INFO] • Starting ...                        $COLOR1│${NC}"
sleep 1
systemctl restart ssh
echo -e " $COLOR1│${NC}  [INFO] • Restarting SSH Services             $COLOR1│${NC}"
sleep 1
systemctl restart squid
echo -e " $COLOR1│${NC}  [INFO] • Restarting Squid Services           $COLOR1│${NC}"
sleep 1
systemctl restart openvpn
systemctl restart nginx
echo -e " $COLOR1│${NC}  [INFO] • Restarting Nginx Services           $COLOR1│${NC}"
sleep 1
systemctl restart dropbear
echo -e " $COLOR1│${NC}  [INFO] • Restarting Dropbear Services        $COLOR1│${NC}"
sleep 1
systemctl restart ws-dropbear
echo -e " $COLOR1│${NC}  [INFO] • Restarting Ws-Dropbear Services     $COLOR1│${NC}"
sleep 1
systemctl restart ws-stunnel
echo -e " $COLOR1│${NC}  [INFO] • Restarting Ws-Stunnel Services      $COLOR1│${NC}"
sleep 1
systemctl restart ws-epro
echo -e " $COLOR1│${NC}  [INFO] • Restarting Ws-epro Services     $COLOR1│${NC}"
sleep 1
systemctl restart stunnel4
echo -e " $COLOR1│${NC}  [INFO] • Restarting Stunnel4 Services        $COLOR1│${NC}"
sleep 1
systemctl restart xray
echo -e " $COLOR1│${NC}  [INFO] • Restarting Xray Services            $COLOR1│${NC}"
sleep 1
systemctl restart cron
echo -e " $COLOR1│${NC}  [INFO] • Restarting Cron Services            $COLOR1│${NC}"
echo -e " $COLOR1│${NC}  [INFO] • All Services Restates Successfully  $COLOR1│${NC}"
sleep 1
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • MasWayVPN •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-set
}

[[ -f /etc/ontorrent ]] && sts="\033[0;32mON \033[0m" || sts="\033[1;31mOFF\033[0m"

enabletorrent() {
[[ ! -f /etc/ontorrent ]] && {
sudo iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1  
sudo netfilter-persistent reload >/dev/null 2>&1 
touch /etc/ontorrent
menu-set
} || {
sudo iptables -D FORWARD -m string --string "get_peers" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "announce_peer" --algo bm -j DROP
sudo iptables -D FORWARD -m string --string "find_node" --algo bm -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
sudo iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
sudo iptables-save > /etc/iptables.up.rules
sudo iptables-restore -t < /etc/iptables.up.rules
sudo netfilter-persistent save >/dev/null 2>&1
sudo netfilter-persistent reload >/dev/null 2>&1 
rm -f /etc/ontorrent
menu-set
}
}

clear
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/acces/main/punten | grep $MYIP | awk '{print $3}')
fi
Domen="$(cat /etc/xray/domain)"
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/acces/main/punten | grep $MYIP | awk '{print $2}')
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "  $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                      << INFORMASI VPS >>                    \E[0m" | lolcat
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e "  ${BLUE}• ${GREEN}Sever Uptime        ${NC}= $( uptime -p  | cut -d " " -f 2-10000 ) "
echo -e "  ${BLUE}• ${GREEN}Current Time        ${NC}= $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "  ${BLUE}• ${GREEN}Operating System    ${NC}= $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g')( $(uname -m))"
echo -e "  ${BLUE}• ${GREEN}Current Domain      ${NC}= $( cat /etc/xray/domain )"
echo -e "  ${BLUE}• ${GREEN}Server IP           ${NC}= ${IP}"
echo -e "  ${BLUE}• ${GREEN}ISP-VPS             ${NC}= ${ISP}"
echo -e "  ${BLUE}• ${GREEN}City                ${NC}= ${CITY}"
echo -e "  ${BLUE}• ${GREEN}Developer           ${NC}= MasWayVPN Tunneling ${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • INFO PANEL MENU •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • INFO PANEL MENU •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • VPS SETTING •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC   ${COLOR1}[01]${NC}  CEK RUNNING  "
echo -e " $COLOR1│$NC   ${COLOR1}[02]${NC}  SET BANNER  "
echo -e " $COLOR1│$NC   ${COLOR1}[03]${NC}  BANDWITH USAGE "
echo -e " $COLOR1│$NC   ${COLOR1}[04]${NC}  ANTI TORRENT $sts"
echo -e " $COLOR1│$NC   ${COLOR1}[05]${NC}  TCP TWEAK"
echo -e " $COLOR1│$NC   ${COLOR1}[06]${NC}  RESTART ALL"
echo -e " $COLOR1│$NC   ${COLOR1}[07]${NC}  AUTO REBOOT"
echo -e " $COLOR1│$NC   ${COLOR1}[08]${NC}  SPEEDTEST "
echo -e " $COLOR1│$NC "
echo -e " $COLOR1│$NC   ${COLOR1}[0]${NC}  Go Back"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • MASWAY VPN •               ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p "  Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; status ;;
02 | 2) clear ; nano /etc/issue.net ;;
03 | 3) clear ; mbandwith ;;
04 | 4) clear ; enabletorrent ;;
05 | 5) clear ; menu-tcp ;;
06 | 6) clear ; restart ;;
07 | 7) clear ; autoboot ;;
08 | 8) clear ; mspeed ;;
00 | 0) clear ; menu ;;
*) clear ; menu-set ;;
esac

       
