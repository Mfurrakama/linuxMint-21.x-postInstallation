#!/bin/bash

# Removing unnecessary programs.
removing_unnused_programs () {
    sudo apt purge -y libreoffice* hexchat thunderbird transmission-gtk
}
# Ensuring 32-bit support.
adding_32bit_support () {
    sudo dpkg --add-architecture i386
}

# Installing updates, packages, apps and icons.
## Adding repositories.
adding_repos () {
    echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
    wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
    sudo rm /etc/apt/preferences.d/nosnap.pref
    sudo mkdir -pm755 /etc/apt/keyrings
    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
}
## apt
installing_nala () {
    sudo apt update && sudo apt install -y nala
    sudo nala fetch --https-only --auto -y
}
installing_packages () {
    sudo nala install -y \
    mint-meta-codecs \
    git \
    adb \
    fastboot \
    neovim \
    virt-manager \
    cpufetch \
    btop \
    libasound2-plugins:i386 \
    libsdl2-2.0-0:i386 \
    libdbus-1-3:i386 \
    libsqlite3-0:i386 \
    v4l2loopback-dkms \
    qbittorrent \
    winehq-staging --install-recommends
}

upgrading_and_cleaning () {
    sudo nala upgrade -y
    sudo nala clean
    sudo nala autoremove
}

## flatpak
installing_flatpak_packages (){
    flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y --user \
    com.brave.Browser \
    org.signal.Signal \
    com.obsproject.Studio \
    com.valvesoftware.Steam \
    net.davidotek.pupgui2 \
    sh.cider.Cider \
    com.github.debauchee.barrier \
    org.onlyoffice.desktopeditors \
    com.obsproject.Studio.Plugin.OBSVkCapture \
    com.stremio.Stremio \
    net.lutris.Lutris \
    com.valvesoftware.Steam.CompatibilityTool.Proton-GE \
    org.gtk.Gtk3theme.Adapta-Nokto-Eta
    flatpak override --user --filesystem=xdg-config/MangoHud:ro com.valvesoftware.Steam
    flatpak override --user --filesystem=xdg-config/MangoHud:ro com.heroicgameslauncher.hgl
}

## pfetch
downloading_pfetch () {
    sudo wget https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch -O /bin/pfetch
    sudo chmod +x /bin/pfetch
}

## fix cedilla (https://github.com/marcopaganini/gnome-cedilla-fix)
fix_cedilla () {
    wget -q https://raw.githubusercontent.com/marcopaganini/gnome-cedilla-fix/master/fix-cedilla -O /tmp/fix-cedilla
    chmod +x /tmp/fix-cedilla
    sudo /tmp/fix-cedilla
}

# Removing Mint's welcome screen.
mint_welcome_remove () {
    mkdir -p "/$HOME/.linuxmint/mintwelcome/"
    touch "/$HOME/.linuxmint/mintwelcome/norun.flag"
}

# Installing themes (Catpuccin and Papirus).
theming () {
    # Catpuccin (https://github.com/catppuccin/gtk)
    wget "https://github.com/catppuccin/gtk/releases/download/v0.4.1/Catppuccin-Mocha-Standard-Blue-Dark.zip" -O "/tmp/catpuccin.zip"
    sudo unzip "/tmp/catpuccin.zip" -d "/usr/share/themes" 
    rm -rf "/tmp/catpuccin.zip"

    # Papirus
    wget -qO- https://git.io/papirus-icon-theme-install | sh

    ## Grub Theming
    git clone https://github.com/vinceliuice/grub2-themes "/tmp/grub2-themes"
    sudo bash "/tmp/grub2-themes/install.sh -b -t tela"
    rm "/tmp/grub2-themes"
}

# Applying my MandoHud configuration.
mangohud_config () {
    mkdir -p "$HOME/.config/MangoHud"
    wget "https://cdn.discordapp.com/attachments/777538729119973397/983705065921593374/MangoHud.conf" -O "$HOME/.config/MangoHud/MangoHud.conf"
}

# Changing the icon, themes, etc.
applying_themes () {
    gsettings set org.cinnamon.desktop.interface cursor-theme 'Bibata-Modern-Classic'
    gsettings set org.cinnamon.desktop.interface gtk-theme 'Catppuccin-Mocha-Standard-Blue-Dark'
    gsettings set org.cinnamon.desktop.interface icon-theme 'Papirus-Dark'
    gsettings set org.cinnamon.theme name 'Catppuccin-Mocha-Standard-Blue-Dark'
}

# Executing all fulctions
removing_unnused_programs
adding_32bit_support
adding_repos
installing_nala
installing_packages
upgrading_and_cleaning
installing_flatpak_packages
downloading_pfetch
fix_cedilla
mint_welcome_remove
theming
mangohud_config
applying_themes

# It's over!
pfetch 
echo "Your system is ready (Rebooting is recommended). | Seu sistema está pronto (Reiniciar é recomendado)."