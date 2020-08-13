#!/bin/bash
genfstab -U /mnt >> /mnt/etc/fstab &&
cp ./5-configure.sh /mnt && arch-chroot /mnt &&
echo "Please run ./5-configure.sh" &&

