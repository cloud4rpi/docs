# Typical Scenarios

!!! Note

    Don't forget to replace '__YOUR_DEVICE_TOKEN__' on sample with the personal device token.

## DS18B20 Temperature Sensor

### Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device
- 1-wire interface should be [enabled](#prerequisites)
- Breadboard, connecting wires, 4.7K Ω resistor

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
Open `sensors.py` sample file from the [examples](`https://github.com/cloud4rpi/cloud4rpi/tree/master/examples/raspberrypi`) folder
- Make necessary changes in `sensors.py` if you have another sensor configuration. 
- Run `sensors` or restart `cloud4rpi` service. New variables 
named `RoomTemp` and `CPUTemp` should appear on such device
page.
- Open `Control Panels` page and add new control panel or open existing one.
- Add new widget of type `Chart` and choose newly added `RoomTemp` variable.
- Add new widget of type `Gauge` and choose newly added `CPUTemp` variable.
- Now you can monitor cpu and room temperature sing these widgets.

## Control LED from WEB

### Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device
- Breadboard, connecting wires, 270-330 Ω resistor


    **Note:**
    Cloud4rpi uses physical pins numbering ([learn more](https://www.raspberrypi.org/documentation/usage/gpio/)).

### Code

``` python
'LEDOn': {
    'type': 'bool',
    'value': False,
    'bind': led_control
},
```

Open `actuator.py` sample file from the [examples](`https://github.com/cloud4rpi/cloud4rpi/tree/master/examples/raspberrypi`) folder

- Uncomment code in `actuator.py`. If you connected led to another GPIO pin
then set correct value to variable `LED_PIN`.
- Run `actuator.py` or restart `cloud4rpi` service. New variable
named `LEDOn` should appear on such device page.
- Open `Control Panels` page and add new control panel or open existing one.
- Add new widget of type `Switch` and choose newly added `LEDOn` variable.
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
 Open `status.py` sample file from the [examples](`https://github.com/cloud4rpi/cloud4rpi/tree/master/examples/raspberrypi`) folder
 
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
 
    Feel free to re-write an event generation logic based with your specific conditions:


- Run `status.py`
- Go to [cloud4rpi](`https://cloud4rpi.io`) website. New variable `STATUS` should appear on such device page.
- Open `Control Panels` page and add new control panel or open existing one.
- Add new widget of type `Text` and choose newly added `STATUS` variable.
- Manage pre-defined status color items according with the event names from a code above.
- In result, you should have the three items like the following:
`{ IDLE: #00ff00}  { RING: #ff6600}  { BOOM!: #ff0000}`
- Now you can monitor colorized incoming status using this widget.



