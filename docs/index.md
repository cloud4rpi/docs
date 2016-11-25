# Connecting a New Device

Do the following instructions to connect your device to Cloud4RPI.

### Prerequisites

It is always a good idea to upgrade your system before installing. Note that it may take some time.
``` bash
$ sudo apt-get update && sudo apt-get upgrade
```

Install the required packages.
``` bash
$ sudo apt-get install git python python-pip
```
NOTE: You can use alternative methods to [install pip](https://pip.pypa.io/en/stable/installing.html).

### Check installation

``` bash
$ pip --version
pip 1.5.6 from /usr/lib/python2.7/dist-packages (python 2.7)
$ git --version
git version 2.1.4
```

### Optional: enable I2C, 1-wire etc. interfaces
- run `sudo raspi-config`
- open `9 Advanced Options`
- enable necessary interfaces
- choose `finish` and reboot device

## Setup Client

### Get cloud4rpi client library

``` bash
$ sudo pip install cloud4rpi
```

### Time to hack together some code

You can see several examples at the _examples_ directory of [https://github.com/cloud4rpi/cloud4rpi](https://github.com/cloud4rpi/cloud4rpi).
Don't forget to insert your device token where prompted, e.g. in io_sensors.py there is a line

```
 DEVICE_TOKEN = '__YOUR_DEVICE_TOKEN__'
```

Using your editor of choice, replace **\_\_YOUR_DEVICE_TOKEN\_\_**
with the token displayed at the top of the device page.

### Run

``` bash
$ sudo python io_sensors.py
```

### Install as a service
You can use our service templates to facilitate service installation.

1. Download the content of the *services* directory of [https://github.com/cloud4rpi/cloud4rpi](https://github.com/cloud4rpi/cloud4rpi) somewhere on your device where you can access it.
2. Check the init manager of your OS

```
$ ps -p 1
```

- If you see output like `1 ?   00:00:36 systemd` your OS is running systemd, use the `install.sh` script together with `service.tmpl`
``` bash
$ sudo bash install.sh path/to/your/script
$ sudo systemctl start cloud4rpi.service
# You can also enable the service to be started on bootup
$ sudo systemctl enable cloud4rpi.service
```

- If you see output like `1 ?   00:00:36 init` your OS is running SysV-style init, use the `install_sysv.sh` script together with `service_sysv.tmpl`
``` bash
$ sudo bash install_sysv.sh path/to/your/script
$ sudo service cloud4rpi start
```

!!! Note

    You need to replace 'path/to/your/script' with the actual service script location.

