# readonlyfs

readonlyfs makes the root file system read-only using overlayfs.

The main purpose is to use it for Raspberry PI.

## Install

Login to Raspbian and clone the repository. Run `install.sh`.

```
$ git clone https://github.com/ushiboy/raspi-basecamp.git
$ cd raspi-basecamp/readonlyfs
$ sudo ./install.sh
```

Edit `/boot/cmdline.txt`.

```
$ sudo vi /boot/cmdline.txt
```

Add `readonlyfs` to the end of the parameter.

```
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=7ee80803-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait quiet readonlyfs
```

Reboot the OS.

```
$ sudo reboot
```

Login again and check mount.

```
$ mount
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,relatime)
udev on /dev type devtmpfs (rw,nosuid,relatime,size=466476k,nr_inodes=116619,mode=755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,noexec,relatime,size=94948k,mode=755)
/dev/mmcblk0p2 on /readonlyfs/system type ext4 (ro,relatime,data=ordered)
tmpfs on /readonlyfs/tmp type tmpfs (rw,relatime)
overlay on / type overlay (rw,noatime,lowerdir=/readonlyfs/system,upperdir=/readonlyfs/tmp/upper,workdir=/readonlyfs/tmp/work)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/lib/systemd/systemd-cgroups-agent,name=systemd)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,relatime,freezer)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,relatime,cpu,cpuacct)
cgroup on /sys/fs/cgroup/net_cls type cgroup (rw,nosuid,nodev,noexec,relatime,net_cls)
cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relatime,blkio)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,devices)
systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=25,pgrp=1,timeout=0,minproto=5,maxproto=5,direct)
sunrpc on /run/rpc_pipefs type rpc_pipefs (rw,relatime)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
mqueue on /dev/mqueue type mqueue (rw,relatime)
configfs on /sys/kernel/config type configfs (rw,relatime)
/dev/mmcblk0p3 on /extra type ext4 (rw,noatime,data=ordered)
/dev/mmcblk0p1 on /boot type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,errors=remount-ro)
tmpfs on /run/user/1000 type tmpfs (rw,nosuid,nodev,relatime,size=94944k,mode=700,uid=1000,gid=1000)
```

It is a success if displayed as `/dev/mmcblk0p2 on /readonlyfs/system type ext4 (ro,relatime,data=ordered)`.

## About parameter value

### `readonlyfs`

Enable read only.

### `noreadonlyfs`

Disable read only.

