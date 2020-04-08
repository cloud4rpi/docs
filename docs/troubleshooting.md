## I receive installation errors

You can get one of the following errors when you use the `sudo pip install cloud4rpi` command to install the Cloud4RPi client library:

1. InstallationError: Command "python setup.py egg_info" failed with error code 1
2. Error while finding spec for 'pip.\_\_main\_\_' (&lt;class 'ImportError'&gt;: cannot import name 'IncompleteRead'); 'pip' is a package and cannot be directly executed

This happens because the **setuptools** and/or **pip** packages your Python interpreter uses are outdated. Update the packages with the following command:

```sh
sudo pip install --upgrade setuptools pip
```

After updating, reinstall **cloud4rpi**:

```sh
sudo pip install cloud4rpi
```



## Raspberry Pi does not recognize my 1-Wire device

Follow the instructions below if you experience issues with the 1-Wire interface on Raspberry Pi.

1. Run `sudo raspi-config` and make sure that the 1-Wire interface is enabled (**Interfacing Options** | **1-Wire** menu).
2. Add the `dtoverlay=w1-gpio` string to your `/boot/config.txt` file (`echo dtoverlay=w1-gpio | sudo tee -a /boot/config.txt`).
3. Reboot (`sudo reboot` command).
4. Double-check the wiring and your device's operational voltage. The 1-Wire **DATA** bus should be connected to **GPIO4** (Pin 7) and pulled-up to **VCC**.

    ![](/res/ds18b20.png)



## I receive an "Insecure Platform" warning

The `InsecurePlatformWarning: A true SSLContext object is not available...` notification appears when you run Cloud4RPi on Python v2.7.9 and earlier. Use the following command to check the Python version:

```sh
python --version
```

You can use [one of the following approaches](https://docs.python.org/2/using/index.html) to install the latest version:



## I get a WiFi library collision in the Arduino IDE

The `Multiple libraries were found for "WiFi.h"` message can appear in Arduino IDE. This indicates the IDE has two libraries with the same name, and it does not know which one to use.

To avoid this error, specify the absolute path to the header file in the `#include` directive, for example:

```c
#include <C:\Users\user\Documents\ArduinoData\packages\esp32\hardware\esp32\1.0.2\libraries\WiFi\src\WiFi.h>
```

You can copy-paste the valid path to both libraries that appear in the error message. Add the `src\` subfolder between the library path and header file name.


## A control panel widget displays a "No data found" error

This means that a variable's name was changed on the device. 

![Unbound Variable](/res/troubleshooting-unbound-variable.png)

If you revert to the old name or assign the new name the widget, the widget will successfully bind to the variable and retain all its data.

