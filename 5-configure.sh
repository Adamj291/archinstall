#!/bin/bash
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime ;
hwclock --systohc ;
locale-gen ;
echo en_GB.UTF-8 UTF-8 >> /etc/locale.gen ; echo "Local Settings Adjusted (Part 1)" ;
echo LANG=en_GB.UTF-8 > /etc/locale.conf ; echo "Local Settings Adjusted (Part 2)" ;
echo export LANG=en_GB.UTF-8 ; echo "Export Local Settings Completed" ;
echo KEYMAP=uk > /etc/vconsole.conf ; echo "Keymap file added to vconsole.conf" ;
echo arch-vm > /etc/hostname ; echo -e "hostname \"arch-vm\" added to /etc/hostname" ;
echo "127.0.0.1     localhost" >> /etc/hosts ;
echo "::1           localhost" >> /etc/hosts ;
echo "127.0.1.1     arch-vm localdomain.arch-vm" >> /etc/hosts ;
echo "Relevant details added to /etc/hosts" ;
mkinitcpio -P ;
# echo "Please change root password" ;
# passwd root ;
read -p 'Please change root account password ' rootpw ;
echo "root:$rootpw" | chpasswd ;
read -p 'whats your username? ' uservar ;
useradd -m -G wheel -s /bin/bash $uservar ;
#echo "Please change the $uservar user account password" ;
#passwd $uservar ;
read -p 'Please change '$uservar' account password ' userpw ;
echo "$uservar:$userpw" | chpasswd ;
sed -i "s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g" /etc/sudoers ; echo "sudoers file updated for wheel account" ;
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=Arch ;
grub-mkconfig -o /boot/grub/grub.cfg ;
echo "Starting Services";
systemctl enable NetworkManager 1> /dev/null;
systemctl enable bluetooth 1> /dev/null;
systemctl enable lightdm 1> /dev/null;
systemctl enable ufw 1> /dev/null;
systemctl enable sshd 1> /dev/null;
systemctl enable cronie 1> /dev/null;
echo "Installing Yay";
cd tmp 1> /dev/null;
git clone https://aur.archlinux.org/yay.git 1> /dev/null;
cd yay 1> /dev/null;
sudo -u nobody makepkg -si 1> /dev/null;
cd .. 1> /dev/null;
rm -R yay/ 1> /dev/null;
echo "Yay has been installed";
echo "Please reboot your system";
exit

# sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
# sed -i "/\%wheel ALL\=\(ALL\) ALL/"'s/^#//' /etc/sudoers
