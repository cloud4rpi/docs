# Connecting an ESP8266

Follow the instructions below to connect your device to the [Cloud4RPi](https://cloud4rpi.io) control panel.

## Prerequisites

Your ESP8266 module should have at least 1Mbyte of flash storage to install the full version of MicroPython.

1. Flash the latest version of [MicroPython](http://micropython.org/) using [the official manual](http://docs.micropython.org/en/latest/esp8266/esp8266/tutorial/intro.html#intro).
2. Connect to your Wi-Fi network:

        >>> from network import WLAN
        >>> STA = WLAN(0); STA.active(1)
        >>> STA.connect('__SSID__', '__PASSWORD__')
        >>> STA.ifconfig()  # Outputs the network configuration. If it is not valid, wait and re-execute

3. Configure [WebREPL](http://docs.micropython.org/en/latest/esp8266/esp8266/tutorial/repl.html#webrepl-a-prompt-over-wifi) for easier file uploading.

        >>> import webrepl_setup

4. Connect to the ESP8266 via **WebREPL**.

## Getting Libraries and Examples

Download the required source code files to your computer:

- [simple.py](https://github.com/micropython/micropython-lib/blob/master/umqtt.simple/umqtt/simple.py): MQTT Library for MicroPython. Save this file as **mqtt.py** when downloading.
- [cloud4rpi.py](https://github.com/cloud4rpi/cloud4rpi-esp8266-micropython/blob/master/cloud4rpi.py): Cloud4RPi client library for MicroPython.
- [main.py](https://github.com/cloud4rpi/cloud4rpi-esp8266-micropython/blob/master/main.py): Sample code.


## Hacking Together some Code

Open the [main.py](https://github.com/cloud4rpi/cloud4rpi-esp8266-micropython/blob/master/main.py) file in a text editor (for instance, [Visual Studio Code](https://code.visualstudio.com/)) and replace the following strings:

- `__SSID__` with your Wi-Fi network name.
- `__PWD__` with your Wi-Fi network password. If you have an open network, remove the `'__PWD__'` element without removing the trailing comma so that the `WIFI_SSID_PASSWORD` variable becomes a tuple with one element.
- `__YOUR_DEVICE_TOKEN__` with the token displayed at the top of the device page on [cloud4rpi.io](https://cloud4rpi.io/). If you have no token yet, open the [Devices](https://cloud4rpi.io/devices) page, create a device using the **New Device** button in the top right corner, and use its token.

Save the file.

## The LED & Button Example's Hardware

Connect the LED to **GPIO12** and a button to **GPIO16**. If you need to use other pins, change the corresponding variables in **main.py**.

![](https://github.com/cloud4rpi/cloud4rpi-esp8266-micropython/raw/master/hardware.png)

## Running

1. Upload three files (**mqtt.py**, **cloud4rpi.py** and **main.py**) to your ESP8266 via the **WebREPL**.
6. Reset the ESP8266. You can use the console for this:

        >>> import machine
        >>> machine.reset()

8. Check that the [device](https://cloud4rpi.io/devices) goes online and starts sending data.
9. Go to the [Control Panels](https://cloud4rpi.io/control-panels/) page and add a new control panel.
10. Add a new **Switch** widget and bind it to the `LED` variable.
11. Add a new **Text** widget and bind it to the `Button` variable. Configure different colors for the "true" and "false" strings.
12. Press the hardware button and notice the changes on the control panel.
13. Use the **LED** switch on the control panel to light the hardware LED.

Explore the code of the [main.py](https://github.com/cloud4rpi/cloud4rpi-esp8266-micropython/blob/master/main.py) file and adapt it for your needs. Feel free to [share](https://cloud4rpi.answerdesk.io/) your projects and ideas with us!
