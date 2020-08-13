#!/bin/bash
genfstab -U /mnt >> /mnt/etc/fstab && echo "fstab has been generated" &&
cp ./5-configure.sh /mnt && echo "Please run ./5-configure.sh" &&
arch-chroot /mnt
