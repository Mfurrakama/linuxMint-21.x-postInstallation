#!/bin/sh
set -x

# Removing unnecessary programs. | Removendo programas desnecessários.
sudo apt remove -y libreoffice-common hexchat thunderbird transmission-gtk

# Ensuring 32-bit support. | Garantindo o suporte à 32-bit.
sudo dpkg --add-architecture i386

# Installing repositories. | Instalando repositórios.
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo add-apt-repository ppa:snwh/ppa -y
sudo add-apt-repository ppa:flexiondotorg/mangohud -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

# Installing updates, packages, apps and icons. | Instalando atualizações, pacotes, apps e ícones.
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update && sudo apt -y full-upgrade
sudo apt install -y git adb fastboot virt-manager qbittorrent neofetch paper-icon-theme papirus-icon-theme neofetch gamemode mangohud lutris winehq-staging autoconf automake inkscape libgdk-pixbuf2.0-dev libglib2.0-dev libxml2-utils pkg-config sassc parallel v4l2loopback-dkms
sudo apt autoclean && apt autoremove -y

# Installing some apps via flatpak
flatpak install flathub -y com.discordapp.Discord com.github.Eloston.UngoogledChromium org.signal.Signal com.obsproject.Studio com.valvesoftware.Steam sh.cider.Cider
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git

# Installing Adapta Nokto and Orchis theme
https://github.com/adapta-project/adapta-gtk-theme "$HOME/adapta-gtk-theme/"
cd "$HOME/adapta-gtk-theme/"
./autogen.sh --prefix=/usr --enable-parallel 
make
sudo make install

# Changing the icon, themes, etc. | Trocando os ícones, temas, etc.
gsettings set org.cinnamon.desktop.wm.preferences theme 'Adapta-Nokto'
gsettings set org.cinnamon.desktop.interface icon-theme 'ePapirus'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Adapta-Nokto'
gsettings set org.cinnamon.desktop.interface cursor-theme 'paper'
gsettings set org.cinnamon.theme name 'Adapta-Nokto'

# It's over!
neofetch
echo "Your system is ready. | Seu sistema está protno."