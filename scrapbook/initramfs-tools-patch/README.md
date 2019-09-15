# patch for initramfs-tools

This is a patch for `initramfs-tools` for Raspbian.

When updating the kernel, the initramfs file and `/boot/config.txt` are also updated.

## Usage

### for v0.133+deb10u1 (Buster)

```
$ sudo patch -p1 -d / < initramfs-tools-v0.133+deb10u1.patch
```

### for v0.130 (Stretch)

```
$ sudo patch -p1 -d / < initramfs-tools-v0.130.patch
```
