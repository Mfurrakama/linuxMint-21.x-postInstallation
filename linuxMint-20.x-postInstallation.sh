#!/bin/sh

## Removendo programas desnecessarios ##
sudo apt remove -y libreoffice-common hexchat thunderbird transmission

## Garantindo o suporte à 32 bits ##
sudo dpkg --add-architecture i386

## Instalando repositorios ##
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:lutris-team/lutris -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo add-apt-repository ppa:snwh/ppa -y

## Instalando tudo (updates, pacotes, apps e icones ##
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install -y git libvirt-daemon-system libvirt-clients qemu-kvm qemu-utils virt-manager ovmf qbittorrent snapd neofetch paper-icon-theme papirus-icon-theme lutris steam minecraft-launcher --install-recommends winehq-devel
sudo ubuntu-drivers autoinstall
sudo apt autoclean && sudo apt autoremove -y
sudo apt dist-upgrade -y

## Instalando Snaps ##
sudo snap install discord spotify ungoogled-chromium onlyoffice-desktopeditors

## Instalando "La capitaine" ##
cd ~/.icons
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git

## Baixando xmr-stak-rx e fazendo suas correções ##
cd ~/Downloads && wget -c https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
tar -xf xmr-stak-rx-linux-1.0.5-cpu.tar.xz

## Reiniciando para os Snaps funcionarem corretamente ##
sudo reboot now
