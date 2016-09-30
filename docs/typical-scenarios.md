# Typical Scenarios

## DS18B20 Temperature Sensor

### Prerequisites

You need

- Сonfigured and [connected](#connecting-a-new-device) Raspberry Pi device
- 1-wire interface should be [enabled](#prerequisites)
- Breadboard, connecting wires, 4.7K Ω resistor

### Code

``` python
'CurrentTemp_1': {
    'type': 'numeric',
    'bind': bind_sensor(ds_sensors, DS_SENSOR_1_INDEX)
},

'CurrentTemp_2': {
    'type': 'numeric',
    'bind': bind_sensor(ds_sensors, DS_SENSOR_2_INDEX)
},
```
- Uncomment code in `app.py`
if you have only 1 or more than 2 ds18b20 sensors - make necessary changes.
- Run `app.py` or restart `cloud4rpi` service. New variables
named `CurrentTemp_1` and `CurrentTemp_2` should appear on such device
page.

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
- Uncomment code in `app.py`. If you connected led to another GPIO pin
then set correct value to variable `LED_PIN`.
- Run `app.py` or restart `cloud4rpi` service. New variable
named `LEDOn_1` should appear on such device page.
- Open `Control Panels` page and add new control panel or open existing one.
- Add new widget of type `Switch` and choose newly added `LEDOn_1` variable.
- Now you can switch LED state using this widget.
