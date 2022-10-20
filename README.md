# Linux Mint 21.x Post Installation Script
A script that adjusts the Linux Mint 20.x into my personal taste, hope you enjoy!

## Installation | Instalação
Open your terminal (control + alt + t) and type the following command:
```sh
curl -sSL https://raw.githubusercontent.com/Mfurrakama/linuxMint-20.x-postInstallation/main/install.sh | bash
```

## Uninstallation
Open your terminal (control + alt + t) and type the following command:
```sh
curl -sSL https://raw.githubusercontent.com/Mfurrakama/linuxMint-20.x-postInstallation/main/revert.sh | bash
```

# Table of Contents
* [Preview](#preview)
  * [Desktop](#desktop--área-de-trabalho)
  * [File Manager](#file-manager--gerenciador-de-arquivos)
  * [Terminal](#terminal)
* [My hardware and my needs](#my-hardware-and-my-needs-enus)
  * [Hardware](#hardware)
  * [What will this script do?](#what-will-this-script-do)
  * [Apps that are going to be removed](#apps-that-are-going-to-be-removed)
  * [PPAs that are going to be added](#ppas-that-are-going-to-be-added)
  * [Apps that are going to be installed](#apps-that-are-going-to-be-installed)
  * [Why I created this?](#why-i-created-this)

## Preview
### Desktop
![](assets/Screenshot01.png)
### File Manager
![](assets/Screenshot02.png)
### Terminal
![](assets/Screenshot03.png)

## My hardware and my needs
  #### Hardware
  - **CPU**: Intel Core i5-10400F
  - **GPU**: ASUS Phoenix NVIDIA 1650 4GB GDDR6
  - **MB**: TUF Gaming B460M-Plus
  - **RAM**: Some random 16 GB Corsair (x2) overclocked to 2666 MHz
  - **SSD**: 960 GB (SATA)
  - **HDD**: 1 500 TB
  - **PSU**: EVGA 600W 80 Plus
  
  ### What will this script do?
  - Remove and install packages
  - Change some config files
  - Build programs (They're exceptions)

  #### Apps that are going to be removed:
  - ~~LibreOffice~~
  - ~~Hexchat~~
  - ~~Thunderbird~~
  - ~~Transmission~~
  - ~~Firefox~~
  
  #### PPAs that are going to be added:
  - [Lutris](https://launchpad.net/~lutris-team/+archive/ubuntu/lutris)
  - [MangoHud](https://launchpad.net/~flexiondotorg/+archive/ubuntu/mangohud)
  - [WineHQ](https://wiki.winehq.org/Ubuntu)
  - [Nala](https://gitlab.com/volian/nala)
  
  #### Apps that are going to be installed:
   **apt**
  - [Virt-manager](https://virt-manager.org/)
  - [pfetch](https://github.com/dylanaraps/pfetch)
  - [WineHQ (Staging)](https://www.winehq.org/)
  - [Snap](https://snapcraft.io/)
  - [Nala](https://gitlab.com/volian/nala)
  - [MangoHud](https://github.com/flightlessmango/MangoHud)
  - [Qbittorrent](https://www.qbittorrent.org/)

   **flatpak**
  - [Discord](https://flathub.org/apps/details/com.discordapp.Discord)
  - [Steam](https://flathub.org/apps/details/com.valvesoftware.Steam)
  - [Brave Browser](https://flathub.org/apps/details/com.brave.Browser)
  - [Signal](https://flathub.org/apps/details/org.signal.Signal)
  - [OBS Studio](https://flathub.org/apps/details/com.obsproject.Studio)
  - [Cider](https://flathub.org/apps/details/sh.cider.Cider)
  - [Barrier](https://flathub.org/apps/details/com.github.debauchee.barrier)
  - [ONLYOFFICE](https://flathub.org/apps/details/org.onlyoffice.desktopeditors)
  - [GIMP](https://flathub.org/apps/details/org.gimp.GIMP)
  - [Stremio](https://flathub.org/apps/details/com.stremio.Stremio)
  - [Kdenlive](https://flathub.org/apps/details/org.kde.kdenlive)
  - [Lutris](https://flathub.org/apps/details/net.lutris.Lutris)

  #### Why I created this?
Because I need someway to install all my preferences in short period of time. Nowadays I use PopOS! With 2 computers I also run Linux Mint on my secundary PC, this script may recieve better support overtime.