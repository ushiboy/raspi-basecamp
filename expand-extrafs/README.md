# expand-extrafs

Expand the `extrafs` partition created by [create-extra-partition](../bin/create-extra-partition) to the maximum size of the SD card.

![expand-extrafs](../docs/images/expand-extrafs.png)

## Install

Login to Raspbian and clone the repository. Run `install.sh`.

```
$ git clone https://github.com/ushiboy/raspi-basecamp.git
$ cd raspi-basecamp/expand-extrafs
$ sudo ./install.sh
```

## Usage

Login to Raspbian, create "/boot/expandfs" and reboot.

```
$ sudo touch /boot/expandfs
$ sudo reboot
```
