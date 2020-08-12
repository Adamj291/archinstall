# **My 5 script Arch Install (Work in progress)**

## **Prepare**

Once booted into the Arch Live Environment check network connection and then run the following commands:

`pacman -Syyu`
`pacman -S git`
`git clone https://github.com/Adamj291/archinstall.git`
`cd ./archinstall`

## **1-start.sh**

This loads the keymap for UK

## **2-efi.sh**

This checks for the EFI folder as this install is aimed at UEFI systems.

## **setup partitions and mount points**

`cfdisk`
`mkfs.fat -F32 /dev/sda1`
`mkswap /dev/sda2`
`swapon /ed/sda2`
`mkfs.ext4 /dev/sda3`

`mount /dev/sda3 /mnt`
`mkdir /mnt/efi`
`mount /dev/sda1 /mnt/efi`

## **3-pacstrap.sh**

This installs the software inc Cinnamon DE

## **4-configure.sh**

This generates the fstab, copies the next script to /mnt and chroot into new file system

## **5-configure.sh**

Sets up host, root user, password, etc. prior to reboot and starts neccesary serfvices
