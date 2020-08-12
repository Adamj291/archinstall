#!/bin/bash
timedatectl set-ntp true &&
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime &&
hwclock --systohc &&
locale-gen &&
echo en_GB.UTF-8 UTF-8 >> /etc/locale.gen &&
echo LANG=en_GB.UTF-8 > /etc/locale.conf &&
echo export LANG=en_GB.UTF-8 &&
echo KEYMAP=uk > /etc/vconsole.conf &&
echo arch-vm > /etc/hostname &&
echo "127.0.0.1     localhost" >> /etc/hosts &&
echo "::1           localhost" >> /etc/hosts &&
echo "127.0.0.1     arch-vm'localdomain arch-vm" >> /etc/hosts &&
echo mkinitcpio -P &&
echo "Please change root password" &&
passwd &&
useradd -m -G wheel -s /bin/bash adam &&
echo "Please change the adam user account password" &&
passwd adam &&
echo "Please uncomment %wheel ALL=(ALL) ALL" &&
EDITOR=nano visudo &&
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=Arch &&
grub-mkconfig -o /boot/grub/grub.cfg &&
echo "Configuration Completed, Please run pacstrap.sh" &&
systemctl enable NetworkManager.service &&
systemctl enable bluetooth.service &&
systemctl enable lightdm.service &&
systemctl enable ufw.service && 
systemctl enable sshd.service  &&
systemctl enable cronie.service &&
reboot now
