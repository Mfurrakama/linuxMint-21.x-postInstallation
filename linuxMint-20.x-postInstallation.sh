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
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

# Installing updates, packages, apps and icons. | Instalando atualizações, pacotes, apps e ícones.
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update && sudo apt -y full-upgrade
sudo apt install -y git adb fastboot libvirt-daemon-system libvirt-clients qemu-kvm qemu-utils virt-manager ovmf qbittorrent neofetch paper-icon-theme papirus-icon-theme linux-xanmod-edge neofetch gamemode mangohud lutris steam minecraft-launcher winehq-staging
flatpak install flathub -y com.discordapp.Discord com.github.Eloston.UngoogledChromium org.DolphinEmu.dolphin-emu org.citra_emu.citra org.signal.Signal com.obsproject.Studio
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
wget -c -O ~/Downloads/Adapta-Nokto.zip https://cinnamon-spices.linuxmint.com/files/themes/Adapta-Nokto.zip?time=1626796848
unzip Adapta-Nokto.zip -d ~/.themes && rm Adapta-Nokto.zip
sudo apt autoclean && apt autoremove -y

# Changing the icon, themes, etc. | Trocando os ícones, temas, etc.
gsettings set org.cinnamon.desktop.wm.preferences theme 'Adapta-Nokto'
gsettings set org.cinnamon.desktop.interface icon-theme 'ePapirus'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Adapta-Nokto'
gsettings set org.cinnamon.desktop.interface cursor-theme 'paper'
gsettings set org.cinnamon.theme name 'Adapta-Nokto'

# Downloading xmr-stak-rx and doing its corrections. | Baixando xmr-stak-rx e fazendo suas correções.
wget -c -O ~/Downloads/xmr-stak-rx-linux-1.0.5-cpu.tar.xz https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
tar -xf ~/Downloads/xmr-stak-rx-linux-1.0.5-cpu.tar.xz && rm ~/Downloads/xmr-stak-rx-linux-1.0.5-cpu.tar.xz
sudo chmod +x ~/Downloads/xmr-stak-rx-linux-1.0.5-cpu/xmr-stak-rx
sudo /bin/su -c "echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf" && sysctl -p
neofetch
echo "Reboot is recommended. | Reinicar é recomendado."
