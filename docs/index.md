# Connecting a New Device

Do the following instructions to connect your device to Cloud4RPI.

## Prerequisites

### Check **python** version

``` bash
$ python --version
 Python 2.7.9
```
Cloud4rpi requires version 2.7.9 or higher. Update your python installation if necessary.

### Check if **pip** installed

``` bash
$ pip --version
pip 1.1 from /usr/lib/python2.7/dist-packages (python 2.7)
```
If you see message `-bash: pip: command not found` you need to install it (see below).

### Install necessary packages

It is always a good idea to upgrade your system before installing. Note that it may take some time.
``` bash
$ sudo apt-get update && sudo apt-get upgrade
```

install **git**
``` bash
$ sudo apt-get install git
```

install **pip** if necessary
``` bash
$ sudo apt-get install python-pip
```

Or use alternative methods to [install pip](https://pip.pypa.io/en/stable/installing.html).

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

### Get packages

``` bash
$ git clone https://github.com/cloud4rpi/cloud4rpi.git
$ cd cloud4rpi
$ sudo pip install -r requirements.txt
```

### Insert Device Token and write your code

For example, using nano: `nano app.py`.

Replace **YOUR_DEVICE_TOKEN** with the token displayed at the device page.

    To exit from nano press ```Ctrl+X```, then ```Y``` to save changes.

### Run

``` bash
$ sudo python app.py
```

### Install as a service

check init manager type of your OS
```
$ ps -p 1
```

- If you see output like `1 ?   00:00:36 systemd` your OS have modern systemd
``` bash
$ sudo bash install.sh
$ sudo systemctl start cloud4rpi.service
```

- If you see output like `1 ?   00:00:36 init` your OS have legacy System V init
``` bash
$ sudo bash install_sysv.sh
$ sudo service cloud4rpi start
```
