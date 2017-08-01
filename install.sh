#!/bin/bash

blue='\e[1;38;5;27m'
red='\e[1;38;5;160m'
green='\e[1;38;5;46m'
NC='\e[0m'

clear;

if [[ $UID != 0 ]];
then
	echo -e "${red}Inicia el Script como root (sudo su) para que funcione correctamente${NC}";
	sleep 3s;
	clear;
	exit 1;
fi

echo -e "${blue}Vamos a comprobar si tienes conexion para poder instalar todos los modulos:${NC}";
sleep 5s;

if netcat -z google.com 80 &>/dev/null;
then
	echo -e "${green}Tienes conexión, iniciando la instalación...${NC}";
	sleep 3s;
  
        echo -e "${blue}Actualizando el sistema...${NC}";
        apt update
        apt upgrade -y

        echo -e "${blue}Instalando Ubuntu Cleaner en el sistema...${NC}";
	sleep 3s;
        cd /root
        mkdir ubugod
        cd ubugod
     add-apt-repository ppa:gerardpuig/ppa
     apt update && apt install ubuntu-cleaner
     apt install python-dbus
            
        echo -e "${blue}Instalando Iconos Papirus y Paper en el sistema...${NC}";
	sleep 3s;
            add-apt-repository ppa:papirus/papirus -y
            add-apt-repository ppa:snwh/pulp -y
            apt update
            apt install papirus-icon-theme paper-icon-theme paper-cursor-theme paper-gtk-theme -y

        echo -e "${blue}Actualizando el sistema...${NC}";
	sleep 3s;
            apt update
            apt upgrade -y

        echo -e "${blue}Instalando Chromium en el sistema...${NC}";
	sleep 3s;
            apt install chromium-browser -y

        echo -e "${blue}Instalando Vlc en el sistema...${NC}";
	sleep 3s;
            add-apt-repository ppa:videolan/master-daily -y
            apt update
            apt install vlc -y
            
        echo -e "${blue}Instalando Gimp en el sistema...${NC}";
	sleep 3s;
            apt install gimp -y
            
        echo -e "${blue}Instalando Brackets en el sistema...${NC}";
	sleep 3s;
            add-apt-repository ppa:webupd8team/brackets -y
            apt update
            apt install brackets -y
                        
        echo -e "${blue}Instalando Sublime Text 3 en el sistema...${NC}";
	sleep 3s;
            apt install sublime-text-installer -y
	    
	echo -e "${blue}Instalando Calibre eBook en el sistema...${NC}";
	sleep 3s;
	    sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
            
        echo -e "${blue}Instalando Steam en el sistema...${NC}";
	sleep 3s;
        cd /root/ubugod
            wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
            dpkg -i steam.deb -y
            apt install -f
            dpkg -i steam.deb -y

        echo -e "${blue}Instalando Playonlinux en el sistema...${NC}";
	sleep 3s;
            apt install playonlinux -y

        echo -e "${blue}Actualizando el sistema...${NC}";
	sleep 3s;
            apt update
            apt upgrade -y
            apt autoremove -y
            #cd /root
            #rm ubugod -R
else
        echo -e "${red}No tienes conexión para instalar correctamente los modulos${NC}";
	sleep 3s;

        echo -e "${blue}Cerrando Script automaticamante${NC}";
    sleep 3s;
clear;
fi
