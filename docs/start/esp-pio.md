# Connecting an ESP8266 or ESP32

Follow the instructions below to connect your [ESP8266](https://en.wikipedia.org/wiki/ESP8266) board (like [NodeMCU Dev Kit](http://www.nodemcu.com/index_en.html#fr_54747661d775ef1a3600009e)) or [ESP32](https://en.wikipedia.org/wiki/ESP32) board (like [ESP32-DevKitC](https://www.espressif.com/en/products/hardware/esp32-devkitc/overview)) to the [Cloud4RPi](https://cloud4rpi.io) control panel.

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
5. Copy-paste the sample code ([ESP8266](https://github.com/cloud4rpi/cloud4rpi-esp-arduino/blob/master/examples/ESP8266/ESP8266.ino), [ESP32](https://github.com/cloud4rpi/cloud4rpi-esp-arduino/blob/master/examples/ESP32/ESP32.ino)) into it.
7. If you know the pin number connected to an LED on your board, replace the `BUILTIN_LED` constant with it.

## Connecting to Your Cloud4RPi Account

4. [Log in to your Cloud4RPi account](https://cloud4rpi.io/signin) or [create a new one](https://cloud4rpi.io/register).
5. Copy [your device](https://cloud4rpi.io/devices)'s **Device Token**. You can create a device on the [Devices](https://cloud4rpi.io/devices) page and copy its **Device Token** if you do not have one.
6. Replace the `__YOUR_DEVICE_TOKEN__` string with your device token.
7. Replace the `__SSID__` and `__PASSWORD__` strings with your Wi-Fi network data.

## Running

6. Hit the `Build` button and wait until the compilation is completed.
8. Hit the `Upload` button.
8. If the upload fails, try to start the board in the flashing mode (connect the power supply with the GPIO0 pin connected to GND) and try uploading again.
9. Once flashing is complete, open `Serial Monitor` and watch the sample code's output.
8. Notice that the [device](https://cloud4rpi.io/devices) went online and started sending data.
9. Go to the [Control Panels](https://cloud4rpi.io/control-panels/) page and add a new control panel.
10. Add a new **Number** widget and bind it to the `Uptime` variable.
10. Add a new **Switch** widget and bind it to the `LED On` variable.
11. Add a new **Text** widget and bind it to the `State` variable. Configure different colors for the **"IDLE"**, **"RING"** and **"BOOM!"** strings.
12. Add a new **Slider** widget and bind it to the `DesiredTemp` variable, set its minimum value to 10 and maximum value to 30.
13. Add a new **Gauge** widget and bind it to the `DesiredTemp` variable, set its minimum value to 10 and maximum value to 30.

## Video

<iframe width="739" height="480" src="https://www.youtube.com/embed/umUjwUjJsNI?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
