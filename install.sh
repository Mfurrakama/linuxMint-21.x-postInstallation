#!/bin/sh
set -x

# Removing unnecessary programs. | Removendo programas desnecessários.
sudo apt purge -y libreoffice-common hexchat thunderbird transmission-gtk firefox

# Ensuring 32-bit support. | Garantindo o suporte à 32-bit.
sudo dpkg --add-architecture i386

# Installing updates, packages, apps and icons. | Instalando atualizações, pacotes, apps e ícones.
## Adding repositories. | Adionando repositórios.
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo add-apt-repository ppa:flexiondotorg/mangohud -y
sudo wget -nc -O "/usr/share/keyrings/winehq-archive.key" https://dl.winehq.org/wine-builds/winehq.key
sudo wget -nc -P "/etc/apt/sources.list.d/" https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
## apt
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update && sudo apt -y full-upgrade
sudo apt install -y mint-meta-codecs snapd git adb fastboot virt-manager cpufetch btop gamemode mangohud lutris winehq-staging autoconf automake inkscape libgdk-pixbuf2.0-dev libglib2.0-dev libxml2-utils pkg-config sassc parallel v4l2loopback-dkms
sudo apt autoclean && sudo apt autoremove -y
## flatpak
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --user com.discordapp.Discord com.brave.Browser org.signal.Signal com.obsproject.Studio com.valvesoftware.Steam net.davidotek.pupgui2 org.freedesktop.Platform.VulkanLayer.MangoHud sh.cider.Cider org.qbittorrent.qBittorrent com.github.debauchee.barrier org.onlyoffice.desktopeditors com.obsproject.Studio.Plugin.OBSVkCapture com.stremio.Stremio org.mozilla.firefox
flatpak update -y
flatpak override --user --filesystem=xdg-config/MangoHud:ro com.valvesoftware.Steam

# Removing Mint's welcome screen.
mkdir -p "/$HOME/socramy/.linuxmint/mintwelcome/"
touch "/$HOME/socramy/.linuxmint/mintwelcome/norun.flag"

# Installing Adapta Nokto/Papirus from source. | Instalando Adapta Nokto/Papirus da fonte.
## Adapta Nokto
git clone https://github.com/adapta-project/adapta-gtk-theme "$HOME/adapta-gtk-theme/"
cd "$HOME/adapta-gtk-theme/"
./autogen.sh --prefix=/usr --enable-parallel 
make
sudo make install
## Papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
# Capitaine Cursors
git clone https://github.com/keeferrourke/capitaine-cursors "$HOME/capitaine-cursors"
cd "$HOME/capitaine-cursors"
./build.sh -p unix -t dark
sudo cp -pr "$HOME/capitaine-cursors/dist/dark/" "/usr/share/icons/capitaine-cursors"

# Applying my MandoHud configuration. | Aplicando minhas configurações do MangoHud.
mkdir -p "$HOME/.config/MangoHud"
wget "https://cdn.discordapp.com/attachments/777538729119973397/983705065921593374/MangoHud.conf" -O "$HOME/.config/MangoHud/MangoHud.conf"

# Changing the icon, themes, etc. | Trocando os ícones, temas, etc.
gsettings set org.cinnamon.desktop.wm.preferences theme 'Adapta-Nokto-Eta'
gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Adapta-Nokto-Eta'
gsettings set org.cinnamon.desktop.interface cursor-theme 'Adwaita'
gsettings set org.cinnamon.theme name 'Adapta-Nokto'

# It's over!
neofetch
echo "Your system is ready. | Seu sistema está pronto."