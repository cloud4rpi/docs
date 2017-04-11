# Connecting a New Device

Follow the instructions below to connect your device to the [Cloud4RPI](https://cloud4rpi.io) cloud control panel.

## Prerequisites

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


### [Optional] Enable interfaces
If your OS is [Raspbian](https://www.raspberrypi.org/downloads/raspbian/), follow the steps below:

- Run `sudo raspi-config`
- Open a section where you can configure additional interfaces. The required section is named `Advanced Options` or `Interfacing Options | Configure connections to peripherals` depending on the version.
- Enable I2C, 1-wire and other necessary interfaces
- Choose `<Finish>`
- Reboot the device with the `sudo reboot` command


## Cloud4RPI Installation
### Get the client library

Install the library using your preferred Python version. The following command will install Cloud4RPI to the system default python (usually Python 2).

``` bash
$ sudo pip install cloud4rpi
```

If you need to use Cloud4RPI with non-default Python, the command will look like this.

``` bash
sudo python3 -m pip install cloud4rpi
```

!!! Note

    For information on how to work with several versions of Python installed, see [Python Documentation](https://docs.python.org/3/installing/).

## Hacking Together some Code

Not it's time to tune Cloud4RPI for your task! We have prepared several samples in the [examples](https://github.com/cloud4rpi/cloud4rpi/tree/master/examples) directory to help you get started.

Clone the Cloud4RPI repository to get the **examples** directory on your device.

``` bash
git clone https://github.com/cloud4rpi/docs.git
```

Before running a sample, don't forget to insert your device token to the line like this.

``` python
 DEVICE_TOKEN = '__YOUR_DEVICE_TOKEN__'
```

Using your favorite editor (for instance, `nano`) to, replace `__YOUR_DEVICE_TOKEN__` with the token displayed at the top of the device page. Your devices are listed on the [Devices](https://cloud4rpi.io/devices) page.


## Running

Simply start the script with the Python.

``` bash
$ sudo python io_sensors.py
```

!!! Note

    If you have installed Cloud4RPI to a non-default Python, use the correct Python version that has Cloud4RPI library installed.

## Installing as a service

You can use our service templates to facilitate service installation.

1. Find the  [services](https://github.com/cloud4rpi/cloud4rpi/tree/master/services) directory in the [cloned repository](#hacking-together-some-code).

2. Check the init manager of your OS

``` bash
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
