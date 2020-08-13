#!/bin/bash
cfdisk && lsblk -n | grep 'sda\|sdb\|nvm' &&
read -p 'whats is the swap partiton? /dev/? ' swapvar &&
read -p 'whats is the efi partiton? /dev/? ' efivar &&
read -p 'whats is the root partiton? /dev/? ' rootvar &&
mkfs.fat -F32 /dev/$efivar &&
mkswap /dev/$swapvar &&
swapon /dev/$swapvar &&
mkfs.ext4 /dev/$rootvar &&
mount /dev/$rootvar /mnt &&
mkdir /mnt/efi &&
mount /dev/$efivar /mnt/efi &&
./3-pacstrap.sh
