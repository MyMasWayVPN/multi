#!/bin/bash
# =========================================
colornow=$(cat /etc/mwstore/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/mwstore/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/mwstore/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
UPDATE="https://raw.githubusercontent.com/mymaswayvpn/multi/main/update/update.sh"
VER="$(cat /opt/.ver)"
BURIQ () {
    curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}
uptime="$(uptime -p | cut -d " " -f 2-10)"
ISP=$(cat /root/.myisp)
CITY=$(cat /root/.mycity)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(cat /root/.myip)
MYIP=$(curl -sS ipv4.icanhazip.com)
lame=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $2}')
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
COLOR2='\033[0;39m'
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

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

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))

total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'
# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

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


# // Root Checking
#if [ "${EUID}" -ne 0 ]; then
		#echo -e "${EROR} Please Run This Script As Root User !"
		#exit 1
#fi


# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-com | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi


#//slowdns
slow=$(systemctl status client-sldns | grep active | cut -d ' ' $stat)
if [ "$slow" = "active" ]; then
status_dns="${GREEN}ON${NC}"
else
status_dns="${RED}OFF${NC}"
fi

# //Udp
udp=$(systemctl status udp-custom | grep active | cut -d ' ' $stat)
if [ "$udp" = "active" ]; then
status_udp="${GREEN}ON${NC}"
else
status_udp="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

clear
clear
function add-host(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • ADD VPS HOST •                ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -rp "  New Host Name : " -e host
echo ""
if [ -z $host ]; then
echo -e "  [INFO] Type Your Domain/sub domain"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu
else
rm -rf /root/domain
rm -rf /root/scdomain
rm -rf /etc/xray/domain
rm -rf /etc/xray/scdomain
echo "$host" > /root/domain
echo "$host" > /root/scdomain
echo "$host" > /etc/xray/domain
echo "$host" > /etc/xray/scdomain
echo "IP=$host" > /var/lib/mwvpn-pro/ipvps.conf
echo ""
echo "  [INFO] Dont forget to renew cert"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "  Press any key to Renew Cret"
crtxray
fi
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
systemctl restart udp-custom
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
systemctl restart ws-com
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
menu
}
clear
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1│${NC}$COLBG1                              • MASWAY TUNNELING •                        $NC$COLOR1│${NC}"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "💠${BIYellow} Server Uptime       🟰 ${COLOR1}$uptime ${NC}"
echo -e "💠${BIYellow} Current Time        🟰 ${COLOR1}$DATE2${NC}"
echo -e "💠${BIYellow} Operating System    🟰 "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "💠${BIYellow} Isp                 🟰 ${COLOR1}$ISP ${NC}"
echo -e "💠${BIYellow} City                🟰 ${COLOR1}$CITY ${NC}"
echo -e "💠${BIYellow} Ip Vps              🟰 ${COLOR1}$IPVPS ${NC}"
echo -e "💠${BIYellow} Current Domain      🟰 ${COLOR1}$( cat /etc/xray/domain )${NC}"
echo -e "💠${BIYellow} Jumlah Ram          🟰 ${COLOR1}${totalram} MB${NC}"
echo -e "💠${BIYellow} CPU Usage           🟰 ${COLOR1}$cpu_usage${NC}"
echo -e "💠${BIYellow} Whatsapp            🟰 ${BOLD}${BICyan}083120857907${NC}"
echo -e "💠${BIYellow} AutoScript By       🟰 ${BOLD}${BICyan}MaSwayVPN${NC}"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1│${NC}$COLBG1                             • STATUS SERVICE •                           $NC$COLOR1│${NC}"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "            ${COLOR2}[ SSH Websocket${NC}: ${status_ws}]  [ NGINX${NC}: ${status_nginx} ] [ XRAY${NC} : ${status_xray} ] "
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1              ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "\e[33m                       SSH / WS / UDP / DNS    : $ssh1"
echo -e "\e[33m                       VMESS / WS / GRPC       : $vma"
echo -e "\e[33m                       VLESS / WS / GRPC       : $vla"
echo -e "\e[33m                       TROJAN / WS / GRPC      : $tra"
echo -e "$COLOR1              ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1              ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "$COLOR1              │      \033[0m• ${GREEN}Version       ${NC}: ${BLUE} ${VER} ${NC}"
echo -e "$COLOR1              │      \033[0m• ${GREEN}Clients Name  ${NC}: ${YELLOW} $lame ${NC}"
echo -e "$COLOR1              │      \033[0m• ${GREEN}Expired       ${NC}: ${YELLOW} $certificate Hari${NC}"
echo -e "$COLOR1              ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "$COLOR1      ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "            ${BICyan} ${NC} ${BICyan}HARI ini${NC}: ${Blue}$ttoday$NC ${BICyan}KEMARIN${NC}: ${Blue}$tyest$NC ${BICyan}BULAN${NC}: ${Blue}$tmon$NC $NC"
echo -e "$COLOR1      ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e ""
echo -e "$COLOR1  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$COLOR1  ║ $COLOR2                        ✶ MASWAY TUNNELING ✶                       $COLOR1   ║"
echo -e "$COLOR1  ║-----------------------------------║-----------------------------------║"
echo -e "$COLOR1  ╠➣$NC 1. SSH MENU                      $COLOR1╠➣$NC 5. THEME MENU                    $COLOR1║ "
echo -e "$COLOR1  ╠➣$NC 2. VMESS MENU                    $COLOR1╠➣$NC 6. UPDATE MENU                   $COLOR1║ "
echo -e "$COLOR1  ╠➣$NC 3. VLESS MENU                    $COLOR1╠➣$NC 7. SETTING MENU                  $COLOR1║ "
echo -e "$COLOR1  ╠➣$NC 4. TROJAN MENU                   $COLOR1╠➣$NC 8. BACKUP&RESTORE                $COLOR1║ "
echo -e "$COLOR1  ║-----------------------------------║-----------------------------------║"
echo -e "$COLOR1  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"
echo -e "$COLOR1  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$COLOR1  ║ $COLOR2                               ✶ MORE ✶                            $COLOR1   ║"
echo -e "$COLOR1  ║-----------------------------------║-----------------------------------║"
echo -e "$COLOR1  ╠➣$NC 09. INSTALL UDP                  $COLOR1╠➣$NC 14. AUTO REBOOT                $COLOR1  ║"
echo -e "$COLOR1  ╠➣$NC 10. ADD DOMAIN                   $COLOR1╠➣$NC 15. CHANGE BANNER              $COLOR1  ║"
echo -e "$COLOR1  ╠➣$NC 11. RENEW CERT                   $COLOR1╠➣$NC 16. CEK BANDWITH               $COLOR1  ║"
echo -e "$COLOR1  ╠➣$NC 12. SPEDDTEST                    $COLOR1╠➣$NC 17. TCP TWEAK                  $COLOR1  ║"
echo -e "$COLOR1  ╠➣$NC 13. IP CHECKING                  $COLOR1╠➣$NC 18. RESTART SERVICE            $COLOR1  ║"
echo -e "$COLOR1  ║-----------------------------------║-----------------------------------║"
echo -e "$COLOR1  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"

echo -ne " Select menu : "; read opt
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; menu-theme ;;
06 | 6) clear ; wget ${UPDATE} && chmod +x update.sh && ./update.sh ;;
07 | 7) clear ; menu-set ;;
08 | 8) clear ; menu-backup ;;
09 | 9) clear ; wget -O install-udp https://raw.githubusercontent.com/mymaswayvpn/multi/main/ssh/udp-custom.sh && chmod +x install-udp && ./install-udp ;;
10) clear ; add-host ;;
11) clear ; crtxray ;;
12) clear ; mspeed ;;
13) clear ; ipsaya ;;
14) clear ; autoboot ;;
15) clear ; nano /etc/issue.net ;;
16) clear ; mbandwith ;;
17) clear ; menu-tcp ;;
18) clear ; restart ;;
999) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
