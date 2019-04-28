# raspi-basecamp

Collection of tools for customizing Raspberry PI (Raspbian).


## Menu

### create-extra-partition

Command to add extrafs partition to Raspbian OS image file.
This requires `kpartx`.

![create-extra-partition](./docs/images/create-extra-partition.png)

```
$ sudo bin/create-extra-partition path/to/YYYY-MM-DD-raspbian-stretch-lite.img
```

### export-compact-os-image

Command to export os image file.

![export-compact-os-image](./docs/images/export-compact-os-image.png)

```
$ sudo bin/export-compact-os-image path/to/sdcard path/to/export.img
```

### readonlyfs

readonlyfs makes the root file system read-only using overlayfs. See [detail](./readonlyfs/README.md).
