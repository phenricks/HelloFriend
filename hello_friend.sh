#!/bin/bash

##### ======================================================================== #####
##### NOME:              hello_friend.sh                                       #####
##### VERSÃO:            0.1:[Test:*]                                          #####
##### DESCRIÇÃO:         Script criado com a finalidade de familiarização      #####
#####                    com o shell script, para agilizar a configuração      #####
#####			 do meu workspace.				       #####
##### DATA DA CRIAÇÃO:   09/07/2021                                            #####
##### ESCRITO POR:       Pedro Henrique                                        #####
##### E-MAIL:            pedrohricksilva@gmail.com                             #####
##### DISTRO:            20.04.1-Ubuntu                                        #####
##### PROJETO:           https://github.com/phenricks/HelloFriend.git          #####
##### ======================================================================== #####

# ------------------------ APRESENTAÇÃO TERMINAL ---------------------- #
    #TODO    
# ----------------------------- VARIÁVEIS ----------------------------- #
    REM_ADD_FLATPAK="https://flathub.org/repo/flathub.flatpakrepo"
    REMMINA_PPA="ppa:remmina-ppa-team/remmina-next"
    CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    
    DIR_DOWNLOADS="$HOME/Downloads/Programas"
    
    APPS_TO_INSTALL=(
        virtualbox
        build-essential 
        module-assistant
        virtualbox-dkms
        virtualbox-ext-pack
        ubuntu-restricted-extras
        gnome-tweak-tool
        git-all
        net-tools
        remmina 
        remmina-plugin-rdp 
        remmina-plugin-secret 
        remmina-plugin-exec 
        remmina-plugin-www  
        remmina-plugin-kwallet
        openssh-server
        openjdk-11-jre-headless
        flatpak
        gnome-software-plugin-flatpak
    )

# ---------------------------------------------------------------------- #

# ------------------------- REQUISITOS BÁSICOS ------------------------- #

## Remove possiveis travas do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adcionando arquitetura de 32 bits ##
sudo dpgk --add-architecture i386

## Atualizando repositório ##
sudo apt update -y

## Adiciona repositórios de terceiros ##
sudo apt-add-repository "$REMMINA_PPA" -y

# ------------------------------- INIT --------------------------------- #

sudo apt update -y # atualização após adcição de possiveis novos repositórios 

# Download e instalação .deb #

mkdir DIR_DOWNLOADS
wget -c "$CHROME_URL" -P "$DIR_DOWNLOADS"
sudo dpkg -i $DIR_DOWNLOADS/*.deb

for programa in ${APPS_TO_INSTALL[@]}; do
	if ! dpkg -l | grep -q $programa; then
		echo -e "\033[0;33m[INSTALANDO: $programa]\033[0m"
		sudo apt install "$programa" -y
	else
		echo -e "\033[0;32m[INSTALADO]\033[0m - $programa"
	fi
done

# ---------------------------------------------------------------------- #

# ------------------------ SNAPS and FLATPAK---------------------------- #

#SNAP
sudo snap install spotify
sudo snap install code --classic

#FLATPAK
flatpak remote-add --if-not-exists flathub "$REM_ADD_FLATPAK"
flatpak install flathub com.discordapp.Discord -y

# ----------------------------- FINALIZAÇÃO ----------------------------- #

## Finalização, atualização e limpeza ##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y

clear 

echo -e "\033[0;32mPROCESSO FINALIZADO!\033[0m"
echo -e "Confira a lista de Programas instalados:s"
for programa in ${APPS_TO_INSTALL[@]}; do
	if  dpkg -l | grep -q $programa; then
		echo -e "\033[1;37m via:apt\033[0m - \033[0;32m[*]\033[0m - $programa"
	fi
done

# ---------------------------------------------------------------------- #