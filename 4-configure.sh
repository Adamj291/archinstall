#!/bin/bash
genfstab -U /mnt >> /mnt/etc/fstab && echo "fstab has been generated" &&
cp ./5-configure.sh /mnt/tmp &&
arch-chroot /mnt /mnt/tmp/5-configure.sh
