# Connecting a New C.H.I.P. Board

Follow the instructions below to connect your device to the [Cloud4RPi](https://cloud4rpi.io) control panel.

## Prerequisites

It is advisable to update your system before installing.

```sh
sudo apt update && sudo apt upgrade -y
```

Install/update the required packages.

```sh
sudo apt install git python python-pip -y
```

You can use alternative methods to [install pip](https://pip.pypa.io/en/stable/installing.html).

!!! Note
    The Cloud4RPi library is compatible with Python 2.7.9+ and Python 3.2+ versions.

## Getting the Cloud4RPi Client Library

Install the library using your preferred Python version. The following command installs and integrates Cloud4RPi with your OS's default Python interpreter (usually Python 2):

```sh
sudo pip install cloud4rpi
```

If you are using Python 3, use the following command:

```sh
sudo python3 -m pip install cloud4rpi
```

!!! Note
    For information on how to work with several versions of Python installed, see [Python Documentation](https://docs.python.org/3/installing/).

If you get an error while using **pip**, try to update the **setuptools** package.

```sh
sudo pip install --upgrade setuptools
```

## Hacking Together some Code

We have prepared sample code for several platforms in the [cloud4rpi-chip-python](https://github.com/cloud4rpi/cloud4rpi-chip-python) repository to demonstrate sending data to the Cloud.

Get Cloud4RPi examples for your device.:

```sh
git clone https://github.com/cloud4rpi/cloud4rpi-chip-python.git && cd cloud4rpi-chip-python
```

Before running a sample, remember to insert your device token to the line like this:

``` python
DEVICE_TOKEN = '__YOUR_DEVICE_TOKEN__'
```

Use a text editor (for instance, `nano`) to replace `__YOUR_DEVICE_TOKEN__` with the token displayed at the top of the device page. If it does not display anything on the [Devices](https://cloud4rpi.io/devices) page, you can create a device using the **New Device** button in the top right corner, and use its token.


## Running

Execute the script with the Python interpreter, for example:

```sh
sudo python control.py
```

!!! Note
    If you have installed Cloud4RPi to a non-default Python, use the version with the Cloud4RPi library.

If the script output looks right, open the [Devices](https://cloud4rpi.io/devices) page to see if the device status has changed.


## Installing as a Service

You can use our service templates to facilitate service installation. Pass the path to your Cloud4RPi-enabled Python script to the [service_install.sh](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh) script as a parameter.

You can use the piped script technique to do this in a single line.

```sh
wget -O - https://raw.githubusercontent.com/cloud4rpi/cloud4rpi/master/service_install.sh | sudo bash -s your_script.py
```

If you are not comfortable running a piped script, or if your Internet connection is unstable, download and run the script manually.

```sh
wget https://raw.githubusercontent.com/cloud4rpi/cloud4rpi/master/service_install.sh
chmod +x service_install.sh
sudo ./service_install.sh your_script.py
```

!!! Note
    You need to replace 'your_script.py' with the actual path to your service script.
