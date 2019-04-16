#!/bin/sh

apt-get update
apt-get install -y busybox
dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile disable
systemctl disable dphys-swapfile
cp -a etc/initramfs-tools /etc
mkinitramfs -o /boot/initrd.gz
echo initramfs initrd.gz >> /boot/config.txt
