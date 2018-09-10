Python Library API
==================

## Library Root

The [Cloud4RPi Python library](https://github.com/cloud4rpi/cloud4rpi) provides the following methods in the [\_\_init\_\_.py](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/__init__.py) file:

* `connect(device_token, host=mqqtBrokerHost, port=None, tls_config=None)` &ndash; connects to the Cloud and returns the [Device](#device) object.

    **Parameters:**

    * `device_token` &ndash; The token displayed at the top of the device page on [cloud4rpi.io](https://cloud4rpi.io/devices). You can get one on the [Devices](https://cloud4rpi.io/devices) page: create a device using the **New Device** button in the top right corner, and use its token.
    * `host` *(optional)* &ndash; The Cloud4RPi MQTT broker address. The default address is defined in the [config.py](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/config.py) file.
    * `port` *(optional)* &ndash; The Cloud4RPi MQTT broker port. The default port is defined in the [config.py](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/config.py) file.
    * `tls_config` *(optional)* &ndash; The parameters for the Paho MQTT's [tls_set()](https://github.com/eclipse/paho.mqtt.python#tls_set) function.

    **Example:**

        import cloud4rpi
        device = cloud4rpi.connect('823SnkK3N8L5Y7QQGiuGd53fi', tls_config={'ca_certs': '/etc/ssl/certs/ca-certificates.crt'})


## Device

The [Device](https://github.com/cloud4rpi/cloud4rpi/blob/master/cloud4rpi/device.py) class provides the following methods to communicate with the Cloud4RPi server and manage the variables state:

* `declare(variables)` &ndash; 
* `declare_diag(diag)` &ndash; 
* `read_config()` &ndash; 
* `read_data()` &ndash; 
* `read_diag()` &ndash; 
* `publish_config(cfg=None)` &ndash; 
* `publish_data(data=None)` &ndash; 
* `publish_diag(diag=None)` &ndash; 
