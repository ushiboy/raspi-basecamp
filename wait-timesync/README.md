# wait-timesync

wait-timesync is a service that waits for NTP synchronization completion by systemd-timesyncd.

The main purpose is to use it for Raspberry PI.

## Install

Login to Raspbian and clone the repository. Run `install.sh`.

```
$ git clone https://github.com/ushiboy/raspi-basecamp.git
$ cd raspi-basecamp/wait-timesync
$ sudo ./install.sh
$ sudo systemctl enable wait-timesync.service
```

## Setting

Edit `/etc/default/wait-timesync`.

| Name | Description | Value |
| --- | --- | --- |
| WAIT_CLOCK_TARGET | The path of the file to be monitored. | /var/lib/systemd/clock |
| WAIT_TIMEOUT | Monitoring timeout seconds. | 60 |

## Usage

Add `After=wait-timesync.service` to your application's systemd configuration file.

```
[Unit]
Description = My Application
After=wait-timesync.service

[Service]
ExecStart = start_app
WorkingDirectory = /var/lib/myapp
Restart=always
Type=simple

[Install]
WantedBy = multi-user.target
```
