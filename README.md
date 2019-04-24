# raspi-basecamp

Collection of tools for customizing Raspberry PI (Raspbian).


## Menu

### create-extra-partition

Command to add extrafs partition to Raspbian OS image file.
This requires kpartx.

```
$ bin/create-extra-partition path/to/YYYY-MM-DD-raspbian-stretch-lite.img
```

### readonlyfs

[readonlyfs](./readonlyfs/README.md) makes the root file system read-only using overlayfs.
