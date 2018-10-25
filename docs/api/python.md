Python Library API
==================

## Library Root

The [Cloud4RPi Python library](https://github.com/cloud4rpi/cloud4rpi) provides the following public methods (defined in the [\_\_init\_\_.py](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/__init__.py) file):

* `connect(device_token, host=mqqtBrokerHost, port=None, tls_config=None)` &ndash; connects to the Cloud and returns a [Device](#device) object.

    **Parameters:**

    * `device_token` &ndash; a token displayed at the top of the device page on [cloud4rpi.io](https://cloud4rpi.io/devices). You can use the **New Device** button in the top right corner of the [Devices](https://cloud4rpi.io/devices) page to create a device and use its token.
    * `host` *(optional)* &ndash; a Cloud4RPi MQTT broker address. The default address is defined in the [config.py](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/config.py) file.
    * `port` *(optional)* &ndash; a Cloud4RPi MQTT broker port. The default port is defined in the [config.py](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/config.py) file.
    * `tls_config` *(optional)* &ndash; a dictionary with parameters for the Paho MQTT's [tls_set()](https://github.com/eclipse/paho.mqtt.python#tls_set) function.

    **Example:**

        import cloud4rpi
        device = cloud4rpi.connect('823SnkK3N8L5Y7QQGiuGd53fi', tls_config={'ca_certs': '/etc/ssl/certs/ca-certificates.crt'})

* `set_logging_to_file(log_file_path)` &ndash; configures the library to save activity logs to a specified file.

    **Parameters:**

    * `log_file_path` &ndash; path to a log file.

* `set_logging_level(level=logging.INFO)` &ndash; changes the logging verbosity level.

    **Parameters:**

    * `level` *(optional)* &ndash; [logging verbosity level](https://docs.python.org/3/library/logging.html#levels). The default level is `INFO`.

## Device

The [Device](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/device.py) class provides the following methods to communicate with the Cloud4RPi server and manage the variables state:

* `declare(variables)` &ndash; configures the variables attached to the device.
    
    **Parameters:**
    
    * `variables` &ndash; a dictionary with the variables description of the following structure: 
        
        `{ name: { 'type': type, 'bind': binding, 'value': value }, ... }`, where:

        * `name` &ndash; an internal variable name. Name cannot contain dots (i.e. **.**) and dollar signs (i.e. **$**). You can change the name displayed in the UI on the device page.
        * `type` &ndash; a variable type. Available types: `'bool'`, `'numeric'` and `'string'`.
        * `binding` &ndash; a function that accepts the current variable as a parameter and returns a new one. This function is called on every value update (scheduled updates and value change signals from Control Panels). You can also pass a Python variable if the value should not be changed from Cloud4RPi Control Panels.
        * `value` *(optional)* &ndash; an initial variable value passed to a `binding` function during the first update.

    **Example:**

        def led_control(value):
            GPIO.output(LED_PIN, value)
            return GPIO.input(LED_PIN)

        ds_sensors = DS18b20.find_all()

        device.declare({
            'Room Temp': {
                'type': 'numeric',
                'bind': ds_sensors[0] if ds_sensors else None
            }, 
            'LED On': {
                'type': 'bool',
                'value': False,
                'bind': led_control
            }
        })


* `declare_diag(diag)` &ndash; configures the diagnostic variables attached to the device.

    **Parameters:**

    * `diag` &ndash; a dictionary with the diagnostic variables description of the following structure:

        `{ name: binding, ... }`, where:

    * `name` &ndash; a diagnostic variable name.
    * `binding` &ndash; a Python variable or function that holds or returns the actual Cloud4RPi diagnostic variable value.

    **Example:**

        device.declare_diag({
            'Host': gethostname(),
            'Operating System': " ".join(uname())
        })

* `read_config()` &ndash; prepares the previously declared (with the `declare(variables)` function) variables configuration for publishing (with the `publish_config(cfg=None)` function).

    **Returns:** A dictionary in the format suitable for the `publish_config(cfg=None)` function.

* `read_data()` &ndash; updates all variable values and prepares the variables state for publishing (with the `publish_data(data=None)` function). This method calls all `binding` functions and saves the returned values as new variable values.

    **Returns:** A dictionary in the format suitable for the `publish_data(data=None)` function.

* `read_diag()` &ndash; reads all diagnostic variable values and prepares the data for publishing (with the `publish_diag(diag=None)` function).

    **Returns:** A dictionary in the format suitable for the `publish_diag(diag=None)` function.

* `publish_config(cfg=None)` &ndash; publishes the variables configuration to the Cloud4RPi server.

    **Parameters:**

    * `cfg` *(optional)* &ndash; the `read_config()` output. If not passed, `read_config()` is invoked internally. This is a list with the following structure:
    
        `[{'name': name, 'type': type}, ...]`, where `name` and `type` corresponds to the same values in the `variables` parameter passed to the `declare(variables)` function.

* `publish_data(data=None)` &ndash; publishes variable values to the Cloud4RPi server.

    **Parameters:**

    * `data` *(optional)* &ndash; the `read_data()` output. If not passed, `read_data()` is invoked internally. This is a dictionary with the following structure:
    
        `{name: value, ...}`, where `name` corresponds to the variable name in the `variables` parameter passed to the `declare(variables)` function, and `value` is the variable value returned by `binding`.
    
* `publish_diag(diag=None)` &ndash; publishes diagnostic variable values to the Cloud4RPi server.

    **Parameters:**

    * `diag` *(optional)* &ndash; the `read_diag()` output. If not passed, `read_diag()` is invoked internally. This is a dictionary with the following structure:
    
        `{name: value, ...}`, where `name` corresponds to the variable name in the `diag` parameter passed to the `declare_diag(diag)` function, and `value` is the variable value the `binding` returns.


