# restart-network

restart-network applies network interface configuration changes without restarting the OS.
This implementation is based on the method described in the following forum article:

https://lb.raspberrypi.org/forums/viewtopic.php?t=199860

## Install

Login to Raspberry PI, clone the git repository and run the installation script.

```
$ git clone https://github.com/ushiboy/raspi-basecamp
$ cd raspi-basecamp/restart-network
$ sudo ./install.sh
```

## Usage

* When restarting all network interfaces (the lo interface is excluded)
    ```
    $ sudo restart-network
    ```
* When restarting the specified network interface
    ```
    $ sudo restart-network eth0
    ```

