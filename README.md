# linuxMint-20.x-postInstallation
A script that adjusts the Linux Mint 20.x into my personal taste, hope you enjoy! | Um script que ajusta o Linux Mint para minhas preferências, espero que goste!

## Installation | Instalação
Open your terminal (control + alt + t) and type the following command: | Abra seu terminal (Ctrl + Alt + T) e digite o comando a seguir:
```sh
curl -sSL https://raw.githubusercontent.com/Mfurrakama/linuxMint-20.x-postInstallation/main/install.sh | bash
```

## Uninstallation | Desinstalaçãõ
Open your terminal (control + alt + t) and type the following command: | Abra seu terminal (Ctrl + Alt + T) e digite o comando a seguir:
```sh
curl -sSL https://raw.githubusercontent.com/Mfurrakama/linuxMint-20.x-postInstallation/main/revert.sh | bash
```

# Table of Contents
* [Preview](#preview)
  *[Desktop](#desktop--área-de-trabalho)
  *[File Manager](#file-manager--gerenciador-de-arquivos)
  *[Terminal](#terminal)
* [My hardware and my needs](#my-hardware-and-my-needs-enus)
  * [Hardware](#hardware)
  * [What will this script do?](#what-will-this-script-do)
  * [Apps that are going to be removed](#apps-that-are-going-to-be-removed)
  * [PPAs that are going to be added](#ppas-that-are-going-to-be-added)
  * [Apps that are going to be installed](#apps-that-are-going-to-be-installed)
  * [Why I created this?](#why-i-created-this)

## Preview
### Desktop | Área de Trabalho
![](assets/Screenshot01.png)
### File Manager | Gerenciador de arquivos
![](assets/Screenshot02.png)
### Terminal
![](assets/Screenshot03.png)

## My hardware and my needs (en_US)

  #### Hardware
  - **CPU**: Intel Core i5-10400F
  - **GPU**: Asus Phoenix NVIDIA 1650 4GB GDDR6
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
  
  #### PPAs that are going to be added:
  - [Lutris](https://launchpad.net/~lutris-team/+archive/ubuntu/lutris)
  - [MangoHud](https://launchpad.net/~flexiondotorg/+archive/ubuntu/mangohud)
  - [WineHQ](https://wiki.winehq.org/Ubuntu)
  
  #### Apps that are going to be installed:
   **apt**
  - Virt-manager
  - Neofetch
  - Lutris
  - WineHQ (Staging)
  - Snap

   **flatpak**
  - [Discord](https://flathub.org/apps/details/com.discordapp.Discord)
  - [Qbittorrent](https://flathub.org/apps/details/org.qbittorrent.qBittorrent)
  - [Steam](https://flathub.org/apps/details/com.valvesoftware.Steam)
  - [Brave Browser](https://flathub.org/apps/details/com.brave.Browser)
  - [Signal](https://flathub.org/apps/details/org.signal.Signal)
  - [OBS Studio](https://flathub.org/apps/details/com.obsproject.Studio)
  - [Cider](https://flathub.org/apps/details/sh.cider.Cider)
  - [Barrier](https://flathub.org/apps/details/com.github.debauchee.barrier)
  - [ONLYOFFICE](https://flathub.org/apps/details/org.onlyoffice.desktopeditors)
  - [GIMP](https://flathub.org/apps/details/org.gimp.GIMP)
    
  #### Why I created this?
Because I need someway to install all my preferences in short period of time. Nowadays I use PopOS! With 2 computers I also run Linux Mint on my secundary PC, this script may recieve better support overtime.
  
  ## Meu hardware e minhas necessidades (pt_BR)
  
  #### Hardware
  - **Processador**: Intel Core i5-10400F
  - **Placa de vídeo**: Asus Phoenix NVIDIA 1650 4GB GDDR6
  - **Placa mãe**: TUF Gaming B460M-Plus
  - **RAM**: Alguma memória aleatória da Corsair 16 (x2) overclockada para 2666 MHz
  - **SSD**: 960 GB (SATA)
  - **HDD**: 1 500 TB
  - **Fonte**: EVGA 600W 80 Plus

### O que esse script vai fazer?
  - Remover e instalar pacotes;
  - Alterar alguns arquivos de configuração;
  - Compilar alguns programas (Eles são exceções).

  #### Apps que vão ser removidos:
  - ~~LibreOffice~~
  - ~~Hexchat~~
  - ~~Thunderbird~~
  - ~~Transmission~~
  
  ### PPAs que vão ser adicionados:
  - [Lutris](https://launchpad.net/~lutris-team/+archive/ubuntu/lutris)
  - [MangoHud](https://launchpad.net/~flexiondotorg/+archive/ubuntu/mangohud)
  - [WineHQ](https://wiki.winehq.org/Ubuntu)
  
  #### Apps que vão ser instalados:
   **apt**
  - Virt-manager
  - Neofetch
  - Lutris
  - WineHQ (Staging)
  - Snap

   **flatpak**
  - [Discord](https://flathub.org/apps/details/com.discordapp.Discord)
  - [Qbittorrent](https://flathub.org/apps/details/org.qbittorrent.qBittorrent)
  - [Steam](https://flathub.org/apps/details/com.valvesoftware.Steam)
  - [Brave Browser](https://flathub.org/apps/details/com.brave.Browser)
  - [Signal](https://flathub.org/apps/details/org.signal.Signal)
  - [OBS Studio](https://flathub.org/apps/details/com.obsproject.Studio)
  - [Cider](https://flathub.org/apps/details/sh.cider.Cider)
  - [Barrier](https://flathub.org/apps/details/com.github.debauchee.barrier)
  - [ONLYOFFICE](https://flathub.org/apps/details/org.onlyoffice.desktopeditors)
  - [GIMP](https://flathub.org/apps/details/org.gimp.GIMP)

  #### Por que eu criei isso?
  Porque eu preciso de um jeito para instalar minhas preferências o mais rápido possível. Hoje em dia eu uso o PopOS! Com 2 computadores eu também uso o Linux Mint no meu computador secundário, esse script vai receber um suporte melhor com o passar do tempo.
