# Connecting an ESP8266

Follow the instructions below to connect your [ESP8266](https://en.wikipedia.org/wiki/ESP8266) board (like [NodeMCU Dev Kit](http://www.nodemcu.com/index_en.html#fr_54747661d775ef1a3600009e)) to the [Cloud4RPi](https://cloud4rpi.io) control panel.

## Prerequisites

* **USB-UART Adapter** (if it is not integrated into your board).
* Access to the ESP8266's **GPIO0** pin to enter flashing mode.

## Creating a Project

The [Cloud4RPi library](http://platformio.org/lib/show/2045/cloud4rpi-esp-arduino) is published in the [PlatformIO Registry](http://platformio.org/lib). Follow the instructions below to start a new Cloud4RPi-enabled project:

1. Create a new PlatformIO project for your board as described in the PlatformIO documentation ([Visual Studio Code](http://docs.platformio.org/en/latest/ide/vscode.html#id3), [Atom](http://docs.platformio.org/en/latest/ide/atom.html#setting-up-the-project))
2. Open your `platformio.ini` and add the following lines to the end:

        lib_deps =
            cloud4rpi-esp-arduino
        
        build_flags=
        ; Required for PubSub library
            -D MQTT_MAX_PACKET_SIZE=1024
            -D MQTT_MAX_TRANSFER_SIZE=128
        ; Enables the verbose output to Serial
            -D CLOUD4RPI_DEBUG=1

4. Save the `platformio.ini` file and open the `src\main.cpp` file.
5. Copy-paste the [sample code](https://github.com/cloud4rpi/cloud4rpi-esp-arduino/blob/master/examples/ESP8266/ESP8266.ino) into it.
7. If you know the pin number connected to an LED on your board, replace the `BUILTIN_LED` constant with it.

## Connecting to Your Cloud4RPi Account

4. [Log in to your Cloud4RPi account](https://cloud4rpi.io/signin) or [create a new one](https://cloud4rpi.io/register).
5. Copy [your device](https://cloud4rpi.io/devices)'s **Device Token**. You can create a device on the [Devices](https://cloud4rpi.io/devices) page and copy its **Device Token** if you do not have one.
6. Replace the `__YOUR_DEVICE_TOKEN__` string with your device token.
7. Replace the `__SSID__` and `__PASSWORD__` strings with your Wi-Fi network data.

## Running

6. Hit the `Build` button and wait until the compilation is completed.
8. Connect the board in the flashing mode (power it with the GPIO0 pin connected to GND) and hit the `Upload` button.
9. Once flashing is complete, open `Serial Monitor` and watch the sample code's output.
8. Notice that the [device](https://cloud4rpi.io/devices) went online and started sending data.
9. Go to the [Control Panels](https://cloud4rpi.io/control-panels/) page and add a new control panel.
10. Add a new **Chart** widget and bind it to the `Uptime` variable.
10. Add a new **Switch** widget and bind it to the `LED On` variable.
11. Add a new **Text** widget and bind it to the `STATUS` variable. Configure different colors for the **"IDLE"**, **"RING"** and **"BOOM!"** strings.

## Video 

<iframe width="739" height="480" src="https://www.youtube.com/embed/umUjwUjJsNI?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
