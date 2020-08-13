#!/bin/bash
loadkeys uk && echo KEYMAP=uk > /etc/vconsole.conf &&
echo "Keyboard Layout Added" &&
if [ -d "/sys/firmware/efi/efivars" ]
    then ./2-partition-mount.sh
else echo "Please restart the installation in UEFI"
fi
