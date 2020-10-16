# machine

Ansible playbooks to configure my personal hardware.

```
# Create + setup new root volume.
sudo lvcreate -V 50G --thin -n new-arch-root sammyboi/pool00
sudo mkfs.ext4 /dev/mapper/sammyboi-new--arch--root
sudo mount /dev/mapper/sammyboi-new--arch--root /mnt
sudo pacstrap /mnt base

sudo arch-chroot /mnt/ mkdir /etc/mkinitcpio.d/
sudo arch-chroot /mnt ln -s /dev/null /etc/mkinitcpio.d/linux.preset

sudo arch-chroot /mnt pacman -S --noconfirm linux linux-firmware ansible git nano man

sudo arch-chroot /mnt passwd

genfstab -U / | grep '/boot\s' | sudo tee -a /mnt/etc/fstab
genfstab -U / | grep '/home\s' | sudo tee -a /mnt/etc/fstab

# ~ Boot into new root. ~

ansible-playbook --become machine.yml
```
