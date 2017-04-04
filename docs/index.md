# Connecting a New Device

Follow the instructions below to connect your device to the [Cloud4RPI](https://cloud4rpi.io) cloud control panel.

### Prerequisites

It is always a good idea to upgrade your system before installing. Note that it may take some time.
``` bash
$ sudo apt-get update && sudo apt-get upgrade
```

 Install the required packages.
``` bash
$ sudo apt-get install git python python-pip
```
You can use alternative methods to [install pip](https://pip.pypa.io/en/stable/installing.html).

!!! Note

    The Cloud4rpi library works correctly with the Python 2.7.9+ and Python 3.2+ versions.

### Check installation

Make sure that you have git and pip installed. 

``` bash
$ pip --version
pip 1.5.6 from /usr/lib/python2.7/dist-packages (python 2.7)
$ git --version
git version 2.1.4
```



### Optional: enable the I2C, 1-wire, etc. interfaces
- run `sudo raspi-config`
- open a section where you can configure additional interfaces. The required section is named `Advanced Options` or `Interfacing Options | Configure connections to peripherals` depending on the version.
- enable necessary interfaces
- choose `finish` and reboot device

## Setup Client

### Get the cloud4rpi client library

``` bash
$ sudo pip install cloud4rpi
```

Install the lib using the available Python version. For example, the following command installs cloud4rpi using Python 3. For information on how to work with other versions of Python installed, see https://docs.python.org/3/installing/. 

```
sudo python3 -m pip install cloud4rpi
```

### Time to hack together some code

You can find several samples in the [examples](https://github.com/cloud4rpi/cloud4rpi/tree/master/examples) directory.
Don't forget to insert your device token where you are prompted, e.g. in `control.py` there is a line

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

1. Download the content of the [services](https://github.com/cloud4rpi/cloud4rpi/tree/master/services) directory and save it somewhere on your device where you can access it.
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
    