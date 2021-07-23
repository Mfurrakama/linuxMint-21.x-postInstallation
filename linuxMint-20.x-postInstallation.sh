#!/bin/sh

## Removing unnecessary programs | Removendo programas desnecessários ##
apt remove -y libreoffice-common hexchat thunderbird transmission

## Ensuring 32-bit support | Garantindo o suporte à 32-bit ##
dpkg --add-architecture i386

## Installing repositories | Instalando repositórios ##
add-apt-repository ppa:papirus/papirus -y
add-apt-repository ppa:lutris-team/lutris -y
apt-add-repository ppa:graphics-drivers/ppa -y
add-apt-repository ppa:snwh/ppa -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

## Installing updates, packages, apps and icons | Instalando atualizações, pacotes, apps e ícones ##
rm /etc/apt/preferences.d/nosnap.pref
apt update
apt install -y git libvirt-daemon-system libvirt-clients qemu-kvm qemu-utils virt-manager ovmf qbittorrent snapd neofetch paper-icon-theme papirus-icon-theme mangohud gamemode lutris steam minecraft-launcher --install-recommends winehq-devel
ubuntu-drivers autoinstall
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
cd ~/Downloads/ && wget -c -O Adapta-Nokto.zip https://cinnamon-spices.linuxmint.com/files/themes/Adapta-Nokto.zip?time=1626796848
unzip Adapta-Nokto.zip -d ~/.themes && rm Adapta-Nokto.zip
apt autoclean && apt autoremove -y
apt dist-upgrade -y

## Changing the icon, themes, etc. | Trocando os ícones, temas, etc.
gsettings set org.cinnammon.desktop.wm.preferences theme 'Adapta-Nokto'
gsettings set org.cinnamon.desktop.interface icon-theme 'ePapirus'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Adapta-Nokto'
gsettings set org.cinnamon.desktop.interface cursor-theme 'paper'
gsettings set org.cinnamon.theme name 'Adapta-Nokto'

## Downloading xmr-stak-rx and doing its corrections | Baixando xmr-stak-rx e fazendo suas correções ##
wget -c https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
tar -xf xmr-stak-rx-linux-1.0.5-cpu.tar.xz && rm xmr-stak-rx-linux-1.0.5-cpu.tar.xz
chmod +x ~/Downloads/xmr-stak-rx-linux-1.0.5-cpu/xmr-stak-rx
echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf && sysctl -p

## Restarting to apply all the upgrades and to Snaps working correctly | Reiniciando para aplicar todas as atualições e para Snaps funcionarem corretamente ##
reboot now
