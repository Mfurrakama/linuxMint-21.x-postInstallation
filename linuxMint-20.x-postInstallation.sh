#!/bin/sh

## Removing unnecessary programs | Removendo programas desnecessários ##
sudo apt remove -y libreoffice-common hexchat thunderbird transmission

## Ensuring 32-bit support | Garantindo o suporte à 32-bit ##
sudo dpkg --add-architecture i386

## Installing repositories | Instalando repositórios ##
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:lutris-team/lutris -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 
sudo add-apt-repository ppa:snwh/ppa -y

## Installing updates, packages, apps and icons | Instalando atualizações, pacotes, apps e ícones ##
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install -y git libvirt-daemon-system libvirt-clients qemu-kvm qemu-utils virt-manager ovmf qbittorrent snapd neofetch paper-icon-theme papirus-icon-theme lutris steam minecraft-launcher --install-recommends winehq-devel
sudo ubuntu-drivers autoinstall
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
sudo apt autoclean && sudo apt autoremove -y
sudo apt dist-upgrade -y

## Installing Snaps | Instalando Snaps ##
sudo snap install discord spotify ungoogled-chromium onlyoffice-desktopeditors

## Downloading xmr-stak-rx and doing its corrections | Baixando xmr-stak-rx e fazendo suas correções ##
cd ~/Downloads && wget -c https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
tar -xf xmr-stak-rx-linux-1.0.5-cpu.tar.xz
sudo echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf && sudo sysctl -p

## Restarting to apply all the upgrades and to Snaps working correctly | Reiniciando para aplicar todas as atualições e para Snaps funcionarem corretamente ##
sudo reboot now
