# Connecting an ESP8266

Follow the instructions below to connect your [ESP8266](https://en.wikipedia.org/wiki/ESP8266) board (like [NodeMCU Dev Kit](http://www.nodemcu.com/index_en.html#fr_54747661d775ef1a3600009e)) to the [Cloud4RPi](https://cloud4rpi.io) control panel.

## Prerequisites

* **USB-UART Adapter** (if it is not integrated into your board).
* Access to ESP8266's **GPIO0** pin to enter flashing mode.

## Getting Libraries and Examples

1. Open **Arduino** and select your board in the **Tools** | **Board** menu. [Add ESP8266 support](https://github.com/esp8266/Arduino) if required.
2. Install the Cloud4RPi library from the **Library Manager** by opening the **Sketch** | **Include Library** | **Manage Libraries** menu, entering `cloud4rpi` into the search field and installing the **cloud4rpi-esp-arduino** package.
3. Install **ArduinoJson** and **PubSubClient** libraries. You should do it manually because the **Library Manager** does not manage package dependencies.
4. Configure the installed libraries:
    1. Open the `%HOMEPATH%\Documents\Arduino\libraries\PubSubClient\src\PubSubClient.h` (`~/Documents/Arduino/libraries/PubSubClient/src/PubSubClient.h` on Mac) file with any text editor (for instance, [VS Code](https://code.visualstudio.com)).
    2. Add the following define directives at the beginning:
        
            #define MQTT_MAX_PACKET_SIZE 1024
            #define MQTT_MAX_TRANSFER_SIZE 128
 
    3. Open the `%HOMEPATH%\Documents\Arduino\libraries\cloud4rpi-esp-arduino\src\Cloud4RPi.h` (`~/Documents/Arduino/libraries/cloud4rpi-esp-arduino/src/Cloud4RPi.h` on Mac) file and enable verbose output by adding the `#define CLOUD4RPI_DEBUG 1` line at the beginning.

## Opening Sample Code

5. Open the sample code using the **File** | **Examples** | **cloud4rpi-esp-arduino** | **ESP8266** menu item. Restart Arduino IDE if this item did not appear.
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
