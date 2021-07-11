#!/bin/bash

##### ========================================================================
##### NOME:              hello_friend.sh                                 #####
##### VERSÃO:            0.1                                             #####
##### DESCRIÇÃO:                                                         #####
##### DATA DA CRIAÇÃO:   09/07/2021                                      #####
##### ESCRITO POR:       Pedro Henrique                                  #####
##### E-MAIL:            pedrohricksilva@gmail.com                       #####
##### DISTRO:            20.04.1-Ubuntu                                  #####
##### PROJETO:           https://gith.b.com/                             #####
##### ========================================================================

## Apresentação Terminal ##

# ----------------------------- VARIÁVEIS ----------------------------- #
    #TODO
    REMMINA_PPA=" ppa:remmina-ppa-team/remmina-next"
    CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    DIR_DOWNLOADS="$HOME/Downloads/Programas"
    

    APPS_TO_INSTALL=(
        virtualbox
        ubuntu-restricted-extras
        remmina 
        remmina-plugin-rdp 
        remmina-plugin-secret
    )
# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #

## Removendo travas do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando repositório ##
sudo apt update -y
# ---------------------------------------------------------------------- #
sudo apt-add-repository "$REMMINA_PPA"


mkdir DIR_DOWNLOADS
wget -c "$CHROME_URL" -P "$DIR_DOWNLOADS"



# ---------------------------------------------------------------------- #

# ----------------------------- SNAPS ---------------------------------- #

sudo snap install spotify

# ----------------------------- FINALIZAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
#flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #