
# DS18B20 Temperature Sensor

## Prerequisites

- Configured and [connected](/#connecting-a-new-device) device with 1-wire support.
- [Enabled](/#prerequisites) 1-wire interface (in case of Raspberry Pi).
- Breadboard, connecting wires, pull-up resistor (4.7KΩ).

## Schematics

![](DS18B20-pinout.png)

- Connect the **GND** pin to any GND output of your board.
- Connect the **Vdd** pin to 5V or 3.3V output of your board.
- Connect the **DQ** pin to the pull-up resistor and the resistor to **Vdd**.
- Connect the **DQ** pin to the 1-wire pin of your board:
    - Raspberry Pi: The default pin is **BCM 4** (Pin 7)
    - C.H.I.P.: **LCD-D2**
    - Omega2: **GPIO 19**

<!-- scheme -->

## Code

- Open the **control.py** sample file ([Raspberry Pi](https://github.com/cloud4rpi/raspberrypi-examples/blob/master/control.py), [C.H.I.P.](https://github.com/cloud4rpi/chip-examples/blob/master/control.py)).
- Replace `__YOUR_DEVICE_TOKEN__` with your personal device token from the [Device](https://cloud4rpi.io/devices) page.

- Run `python control.py`. New variables named `Room Temp` and `CPU Temp` should appear on the device page.
- Open the `Control Panels` page and add a new control panel or open an existing one.
- Add a new `Chart` widget and choose the newly added `RoomTemp` variable.
- Add a new `Gauge` widget and choose the newly added `CPUTemp` variable.
- Now you can monitor CPU and room temperature using these widgets.

!!! Note
    If you need the temperature monitoring to start automatically on system load, install the **control.py** script as a service using our [service_install.sh](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh) script.


# Control LED from WEB

## Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device
- Breadboard, connecting wires, 270-330 Ω resistor


!!! Note

    Cloud4rpi uses physical pins numbering ([learn more](https://www.raspberrypi.org/documentation/usage/gpio/)).

## Code

``` python
'LEDOn': {
    'type': 'bool',
    'value': False,
    'bind': led_control
},
```

- Open the [actuator.py](https://github.com/cloud4rpi/cloud4rpi-examples/blob/master/raspberrypi/actuator.py) sample file.
- Uncomment code in `actuator.py`. If you connected an LED to a differed GPIO pin, set the correct value to the `LED_PIN` variable.
- Run `actuator.py` or restart the `cloud4rpi` service. A new variable named `LEDOn` should appear on the device page.
- Open the `Control Panels` page and add a new control panel or open an existing one.
- Add a new `Switch` widget and choose the newly added `LEDOn` variable.
- Now you can switch LED state using this widget.


# Monitor Device Events using colored status

## Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device

## Code
``` python
'STATUS': {
    'type': 'string',
    'bind': listen_for_events
}
```

Open the [status.py](https://github.com/cloud4rpi/cloud4rpi-examples/blob/master/raspberrypi/status.py) sample file

## Code

``` python
def listen_for_events():
    # write your own logic here
    result = random.randint(1, 5)
    if result == 1:
        return 'RING'

    if result == 5:
        return 'BOOM!'

    return 'IDLE'
```
!!! Note

    Feel free to re-write event generation logic based on your specific conditions:


- Run [status.py](https://github.com/cloud4rpi/cloud4rpi-examples/blob/master/raspberrypi/status.py) or restart the `cloud4rpi` service. A new variable named `STATUS` should appear on the device page.
- Open the `Control Panels` page and add a new control panel or open an existing one.
- Add a new `Text` widget and choose the newly added `STATUS` variable.
- Change the pre-defined status color items according to the event names from the code above.
- As a result, you should have three items like the following:
`{ IDLE: #00ff00}  { RING: #ff6600}  { BOOM!: #ff0000}`
- Now this widget displays incoming status with color.
