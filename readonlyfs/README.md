# readonlyfs


```
$ sudo apt-get install -y busybox
$ sudo dphys-swapfile swapoff
$ sudo dphys-swapfile uninstall
$ sudo update-rc.d dphys-swapfile disable
$ sudo systemctl disable dphys-swapfile
$ sudo cp -a etc/initramfs-tools /etc
$ sudo mkinitramfs -o /boot/initrd.gz
$ sudo sh -c "echo initramfs initrd.gz >> /boot/config.txt"
```
