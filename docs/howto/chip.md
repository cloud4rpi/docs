# Control LED from WEB using C.H.I.P.

## Prerequisites

- Configured and [connected](/#connecting-a-new-device) device.
- Breadboard, connecting wires, 330Ω..1kΩ resistor.

## Code

- Open the [control.py](https://github.com/cloud4rpi/cloud4rpi-chip-python/blob/master/control.py) sample file.
- Replace `__YOUR_DEVICE_TOKEN__` with the device token from the [Device](https://cloud4rpi.io/devices) page.
- Connect an LED to a GPIO pin and set the correct value to the `LED_PIN` variable. The default pin is **XIO-P0**.
- Run `sudo python control.py`. A new `LED On` variable should appear on the [Device](https://cloud4rpi.io/devices) page.
- Open the [Control Panels](https://cloud4rpi.io/control-panels/) page and add a new control panel.
- Add a new **Switch** widget and choose the newly added `LED On` variable.

You can now switch the LED state using this widget.

# Monitor Device Events using Colored Status

## Prerequisites

- Configured and [connected](/#connecting-a-new-device) device.

## Code

- Open the [control.py](https://github.com/cloud4rpi/cloud4rpi-chip-python/blob/master/control.py) sample file.
- Replace `__YOUR_DEVICE_TOKEN__` with the device token from the [Device](https://cloud4rpi.io/devices) page.
- Run `sudo python control.py`. A new `STATUS` variable should appear on the [Device](https://cloud4rpi.io/devices) page.
- Open the [Control Panels](https://cloud4rpi.io/control-panels/) page and add a new control panel or open an existing one.
- Add a new `Text` widget and choose the newly added `STATUS` variable.
- Change the pre-defined status color items according to the event names from the code above.
- As a result, you should have the following items:
`{ IDLE: #00ff00}  { RING: #ff6600}  { BOOM!: #ff0000}`

Now this widget displays an incoming status with color.


# Connect DS18B20 Temperature Sensor

This example shows how to use the [DS18B20](https://datasheets.maximintegrated.com/en/ds/DS18B20.pdf) temperature sensor with the Cloud4RPi service.

## Prerequisites

- Configured and [connected](/#connecting-a-new-device) device.
- Breadboard, connecting wires, a pull-up resistor (4.7kΩ).

## Schematics

![](/res/ds18b20.png)

- Connect the **GND** pin to any GND pin on your board.
- Connect the **Vdd** pin to a 5V or 3.3V pin.
- Connect the **DQ** pin to the pull-up resistor and the resistor to **Vdd**.
- Connect the **DQ** pin to the **LCD-D2** pin.

You can connect several 1-Wire devices to the bus without additional resistors.

## Code

- Open the [control.py](https://github.com/cloud4rpi/cloud4rpi-chip-python/blob/master/control.py).
- Replace `__YOUR_DEVICE_TOKEN__` with the device token from the [Device](https://cloud4rpi.io/devices) page.

- Run `sudo python control.py`. New `Room Temp` and `CPU Temp` variables should appear on the [Device](https://cloud4rpi.io/devices) page.
- Open the [Control Panels](https://cloud4rpi.io/control-panels/) page and add a new control panel.
- Add a new **Chart** widget and choose the newly added `Room Temp` variable.
- Add a new **Gauge** widget and choose the newly added `CPU Temp` variable.

You can now monitor CPU and room temperature using these widgets.

!!! Note
    If you need to start your script automatically when the system loads, install the **control.py** script as a service using our [service_install.sh](https://github.com/cloud4rpi/cloud4rpi-chip-python/blob/master/service_install.sh) script. Refer to the [Installing as a Service](https://docs.cloud4rpi.io/start/chip/#installing-as-a-service) section for more details.



# Secure your MQTT connection

Cloud4RPi supports the TLS-enabled MQTTs protocol. If your task requires an encrypted data transfer, enable TLS by changing the `cloud4rpi.connect()` method call as follows:

```python
device = cloud4rpi.connect(DEVICE_TOKEN, tls_config={'ca_certs': '/etc/ssl/certs/ca-certificates.crt'})
```

The `tls_config` dictionary holds parameters for the Paho MQTT's [tls_set()](https://github.com/eclipse/paho.mqtt.python#tls_set) function.