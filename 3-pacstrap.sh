#!/bin/bash

pacstrap /mnt base linux linux-firmware linux-headers dkms pacman-contrib base-devel git sudo networkmanager usbutils pciutils pkgfile diffutils logrotate smartmontools dialog fuse2 fuse3 ntfs-3g exfat-utils exfatprogs gvfs gvfs-smb gvfs-afc gvfs-goa gvfs-gphoto2 gvfs-google gvfs-mtp gvfs-nfs nfs-utils dosfstools findutils mlocate amd-ucode grub os-prober efibootmgr less nano vi vim openssh cronie xdg-user-dirs haveged bash-completion man-db man-pages texinfo lsb-release polkit unrar zip unzip p7zip unace xz lzop bashtop htop neofetch ncdu mc nmon archiso perl python ddrescue dd_rescue testdisk hardinfo hwinfo network-manager-applet net-snmp samba smbnetfs smbclient nmap traceroute rsync grsync ufw gufw ufw-extras blueman bluez-utils bluez bluez-libs pulseaudio pulseeffects pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer xorg xorg-xinit xorg-apps xorg-drivers font-bh-ttf gsfonts sdl_ttf ttf-bitstream-vera ttf-dejavu ttf-liberation xorg-fonts-type1 ttf-ubuntu-font-family noto-fonts ttf-opensans lightdm lightdm-gtk-greeter lightdm-webkit2-greeter cinnamon nemo nemo-fileroller gparted gnome-disk-utility baobab tilda terminator xdg-utils gprename grub-customizer yelp namcap wavemon bleachbit dconf-editor parcellite libreoffice-fresh xreader galculator gedit xed pandoc discount calibre inkscape firefox evolution qbittorrent cmus vlc celluloid gimp digikam darktable rawtherapee shotwell hugin gnome-screenshot sl lolcat cmatrix flac wavpack lame faac faad2 celt a52dec libdca libmad libmpcdec opencore-amr opus speex libvorbis libfdk-aac fdkaac libmpeg2 x264 x265 libdv xvidcore ffmpeg jasper libwebp && ./4-configure.sh

#REMOVED
#lib32-alsa-plugins (Yay)
#alsa-utils
#alsa-utils 
#alsa-plugins
