#!/bin/sh

if [ "`whoami`" != "root" ]; then
    echo "Require root privilege"
    exit 1
fi

apt-get update
apt-get install -y busybox initramfs-tools
dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile disable
systemctl disable dphys-swapfile
cp -a etc/initramfs-tools /etc
update-initramfs -c -k $(uname -r)
echo "initramfs initrd.img-$(uname -r)" >> /boot/config.txt
./initramfs-tools-patch/install.sh
