#!/bin/sh
set -x

# Removing unnecessary programs.
sudo apt purge -y libreoffice* hexchat thunderbird transmission-gtk
# Ensuring 32-bit support.
sudo dpkg --add-architecture i386

# Installing updates, packages, apps and icons.
## Adding repositories.
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo rm /etc/apt/preferences.d/nosnap.pref
## apt
sudo apt update && sudo apt install -y nala
sudo nala upgrade -y
sudo nala install -y mint-meta-codecs git adb fastboot neovim virt-manager cpufetch btop mangohud lutris wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 autoconf automake inkscape libgdk-pixbuf2.0-dev libglib2.0-dev libxml2-utils pkg-config sassc parallel v4l2loopback-dkms qbittorrent
sudo nala remove inkscape
sudo nala clean
## flatpak
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --user com.brave.Browser org.signal.Signal com.obsproject.Studio com.valvesoftware.Steam net.davidotek.pupgui2 sh.cider.Cider com.github.debauchee.barrier org.onlyoffice.desktopeditors com.obsproject.Studio.Plugin.OBSVkCapture com.stremio.Stremio org.gtk.Gtk3theme.Adapta-Nokto-Eta
sudo flatpak remote-delete --system flathub
flatpak override --user --filesystem=xdg-config/MangoHud:ro com.valvesoftware.Steam
## pfetch
sudo wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch -O /bin/pfetch
sudo chmod +x /bin/pfetch
## fix cedilla
wget -q https://raw.githubusercontent.com/marcopaganini/gnome-cedilla-fix/master/fix-cedilla -O /tmp/fix-cedilla
cd /tmp/
chmod +x fix-cedilla
sudo ./fix-cedilla

# Removing Mint's welcome screen.
mkdir -p "/$HOME/.linuxmint/mintwelcome/"
touch "/$HOME/.linuxmint/mintwelcome/norun.flag"

# Installing Adapta Nokto/Papirus from source.
## Adapta Nokto
git clone https://github.com/adapta-project/adapta-gtk-theme "/tmp/adapta-gtk-theme/"
cd "/tmp/adapta-gtk-theme/"
./autogen.sh --prefix=/usr --enable-parallel 
make
sudo make install
## Papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
## Grub Theming
git clone https://github.com/vinceliuice/grub2-themes "/tmp/grub2-themes"
cd "/tmp/grub2-themes"
sudo ./install.sh -b -t tela

# Applying my MandoHud configuration.
mkdir -p "$HOME/.config/MangoHud"
wget "https://cdn.discordapp.com/attachments/777538729119973397/983705065921593374/MangoHud.conf" -O "$HOME/.config/MangoHud/MangoHud.conf"

# Changing the icon, themes, etc.
gsettings set org.cinnamon.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Adapta-Nokto-Eta'
gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.cinnamon.theme name 'Adapta-Nokto'

# It's over!
pfetch 
echo "Your system is ready (Rebooting is recommended). | Seu sistema está pronto (Reiniciar é recomendado)."
