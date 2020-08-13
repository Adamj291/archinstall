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
echo "127.0.1.1     arch-vm localdomain.arch-vm" >> /etc/hosts &&
mkinitcpio -P &&
echo "Please change root password" &&
passwd root &&
read -p 'whats your username? ' uservar &&
useradd -m -G wheel -s /bin/bash $uservar &&
echo "Please change the $uservar user account password" &&
passwd $uservar &&
echo "Please uncomment %wheel ALL=(ALL) ALL" &&
EDITOR=nano visudo &&
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=Arch &&
grub-mkconfig -o /boot/grub/grub.cfg &&
systemctl enable NetworkManager &&
systemctl enable bluetooth &&
systemctl enable lightdm &&
systemctl enable ufw &&
systemctl enable sshd  &&
systemctl enable cronie &&
sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf &&
git clone https://github.com/NoiSek/Aether.git &&
cp --recursive Aether /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether &&
sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = lightdm-webkit-theme-aether #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf &&
rm -R Aether/ &&
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf && pacman -Fy &&
git clone https://aur.archlinux.org/yay.git &&
cd yay &&
makepkg -si &&
cd .. &&
rm -R yay/ &&
exit & reboot

# sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
# sed -i "/\%wheel ALL\=\(ALL\) ALL/"'s/^#//' /etc/sudoers
