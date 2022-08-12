#!/bin/sh
set -x

# Changing the icon, themes, etc. | Trocando os ícones, temas, etc.
gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y'
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y-Dark-Blue'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-Blue'
gsettings set org.cinnamon.desktop.interface cursor-theme 'Adwaita'
gsettings set org.cinnamon.theme name 'Mint-Y-Dark-Blue'

# Removing my MandoHud configuration. | Removendo minhas configurações do MangoHud.
rm "$HOME/.config/MangoHud/MangoHud.conf"

# Removing themes. | Removendo temas.
sudo rm -rf "/usr/share/themes/Adapta"
sudo rm -rf "/usr/share/themes/Adapta-Eta"
sudo rm -rf "/usr/share/themes/Adapta-Nokto"
sudo rm -rf "/usr/share/themes/Adapta-Nokto-Eta"
sudo rm -rf "usr/share/icons/ePapirus"
sudo rm -rf "usr/share/icons/ePapiurs-Dark"
sudo rm -rf "usr/share/icons/Papirus"
sudo rm -rf "usr/share/icons/Papirus-Dark"
sudo rm -rf "usr/share/icons/Papirus-Light"
rm -rf "$HOME/adapta-gtk-theme/"

# Bringing back the Mint's Welcome screen.
rm "$HOMEq.linuxmint/mintwelcome/norun.flag"

# Removing pfetch
sudo rm /bin/pfetch

# Uninstalling flatpaks programs
flatpak remove -y com.discordapp.Discord com.brave.Browser org.signal.Signal com.obsproject.Studio com.valvesoftware.Steam org.freedesktop.Platform.VulkanLayer.MangoHud sh.cider.Cider org.qbittorrent.qBittorrent com.github.debauchee.barrier org.onlyoffice.desktopeditors com.obsproject.Studio.Plugin.OBSVkCapture org.mozilla.firefox org.gtk.Gtk3theme.Adapta-Nokto-Eta

# Removing Adittional packages
sudo apt remove -y mint-meta-codecs git adb fastboot virt-manager neofetch neofetch gamemode mangohud lutris winehq-staging autoconf automake inkscape v4l2loopback-dkms

# Reinstalling default programs
sudo apt install -y libreoffice-common hexchat thunderbird transmission-gtk firefox
