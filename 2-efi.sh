#!/bin/bash

if [ -d "/sys/firmware/efi/efivars" ]
    then echo "EFI Partition Exists, Please partition and mount drives and then run 3-pacstrap.sh"
else echo "Please restart the installation in UEFI"
fi
