# Typical Scenarios

!!! Note

    Don't forget to replace `__YOUR_DEVICE_TOKEN__` in the samples with the personal device token.

## DS18B20 Temperature Sensor

### Prerequisites

You need:

- Сonfigured and [connected](/#connecting-a-new-device) Raspberry Pi device.
- [Enabled](/#prerequisites) 1-wire interface.
- Breadboard, connecting wires, 4.7KΩ resistor.

### Code

``` python
'RoomTemp': {
    'type': 'numeric',
    'bind': ds_sensors[0]
},
# 'OutsideTemp': {
#     'type': 'numeric',
#     'bind': ds_sensors[1]
# },
'CPUTemp': {
    'type': 'numeric',
    'bind': rpi.cpu_temp
}
```
Open the `sensors.py` sample file from the [examples](`https://github.com/cloud4rpi/cloud4rpi/tree/master/examples`) folder

- Make necessary changes in `sensors.py` if you have another sensor configuration.
- Run `sensors` or restart the `cloud4rpi` service. New variables
named `RoomTemp` and `CPUTemp` should appear on such device
page.
- Open the `Control Panels` page and add a new control panel or open an existing one.
- Add a new `Chart` widget and choose the newly added `RoomTemp` variable.
- Add a new `Gauge` widget and choose the newly added `CPUTemp` variable.
- Now you can monitor CPU and room temperature using these widgets.

## Control LED from WEB

### Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device
- Breadboard, connecting wires, 270-330 Ω resistor


!!! Note

    Cloud4rpi uses physical pins numbering ([learn more](https://www.raspberrypi.org/documentation/usage/gpio/)).

### Code

``` python
'LEDOn': {
    'type': 'bool',
    'value': False,
    'bind': led_control
},
```

Open the `actuator.py` sample file from the [examples](`https://github.com/cloud4rpi/cloud4rpi/tree/master/examples`) folder

- Uncomment code in `actuator.py`. If you connected an LED to a differed GPIO pin, set the correct value to the `LED_PIN` variable.
- Run `actuator.py` or restart the `cloud4rpi` service. A new variable named `LEDOn` should appear on the device page.
- Open the `Control Panels` page and add a new control panel or open an existing one.
- Add a new `Switch` widget and choose the newly added `LEDOn` variable.
- Now you can switch LED state using this widget.


## Monitor Device Events using colored status

### Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device

### Code
``` python
'STATUS': {
    'type': 'string',
    'bind': listen_for_events
}
```
 Open the `status.py` sample file from the [examples](`https://github.com/cloud4rpi/cloud4rpi/tree/master/examples`) folder

### Code
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


- Run `status.py` or restart the `cloud4rpi` service. A new variable named `STATUS` should appear on the device page.
- Open the `Control Panels` page and add a new control panel or open an existing one.
- Add a new `Text` widget and choose the newly added `STATUS` variable.
- Change the pre-defined status color items according to the event names from the code above.
- As a result, you should have three items like the following:
`{ IDLE: #00ff00}  { RING: #ff6600}  { BOOM!: #ff0000}`
- Now this widget displays incoming status with color.
