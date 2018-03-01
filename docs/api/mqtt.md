# Prerequisites

The examples in this section are presented for the [Eclipse Mosquitto™](https://mosquitto.org/) MQTT client. Install the client if you are going to run the examples:

```sh
sudo apt-get install mosquitto-clients
```

# Cloud4RPi MQTT Broker

Use the following data to connect to the MQTT broker:

* **Host:** 
    * With SSL encryption: `mqtts://mq.cloud4rpi.io`
    * Without SSL encryption: `mqtt://mq.cloud4rpi.io`
* **Port:** 
    * With SSL encryption: `8883`
    * Without SSL encryption: `1883`
* **Client ID**: Your [Device](https://cloud4rpi.io/devices/) Token


!!! Warning
    Since the **Client ID** is used for authentication, you should not open more than one connection with a single **Device Token** at the same time.

!!! Note
    **Login** and **Password** are not used, you can leave them empty.


# Variables Configuration

Update the device's configuration by sending messages to the following topic:

```gradle
devices/{token}/config
```

### Topic Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

## Message Structure

```javascript
{
    "payload": {
        [
            {"name": name, "type": type},
            {"name": name, "type": type},
            // ...
            {"name": name, "type": type}
        ]
    }
}
```

### Parameters

Name               | Description   | Type   | Possible Values
------------------ | ------------- | ------ | ----------------------------
name               | Variable name | string | Any string
type               | Variable type | string | "bool", "numeric" or "string"


## Example

The following example creates two variables on the device:

* **Temperature** (numeric)
* **LEDOn** (boolean)


```sh
export DEVICE_TOKEN=your_device_token
mosquitto_pub -q 1 -d -t "devices/$DEVICE_TOKEN/config" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN" \
              -m '{"payload":[{"name":"Temperature","type":"numeric"},{"name":"LEDOn","type":"bool"}]}'
```


!!! Note
    Replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

# Variable Values

!!! Note
    Before sending variable values, configure variables by sending the [Variables Configuration message](#variables-configuration).

Send messages with your variable values to the following topic:

```gradle
devices/{token}/data
```

### Topic Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token



## Message Structure

```javascript
{
    "ts": datetime_isoformat,
    "payload": {
        var_name: var_value,
        var_name: var_value,
        // ...
        var_name: var_value
    }
}
```

### Parameters

Name               | Description          | Type          | Possible Values
------------------ | -------------------- | ------------- | ----------------------------
datetime_isoformat | Timestamp (optional) | string        | Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly
var_name           | Variable name        | string        | One of the variables
var_value          | Variable value       | corresponding | Any


## Example

The following example sends the values of two variables:

* **Temperature**: *24*
* **LEDOn**: *true*

```sh
export DEVICE_TOKEN=your_device_token
mosquitto_pub -q 1 -d -t "devices/$DEVICE_TOKEN/data" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN" \
              -m '{"payload":{"Temperature":24,"LEDOn":true}}'
```

!!! Note
    Replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).


# Diagnostic Data

Send messages with your device's diagnostic data to the following topic:

```gradle
devices/{token}/diagnostics
```

### Topic Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token


## Message Structure

```javascript
{
    "ts": datetime_isoformat,
    "payload": {
        var_name: var_value,
        var_name: var_value,
        // ...
        var_name: var_value
    }
}
```

### Parameters

Name               | Description          | Type   | Possible Values
------------------ | -------------------- | ------ | ----------------------------
datetime_isoformat | Timestamp (optional) | string | Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly
var_name           | Variable name        | string | Any
var_value          | Variable value       | any    | Any


## Example

The following example sends the following diagnostic values to Cloud4RPI:

* **CPU Temperature**: *41*
* **IP Address**: *192.168.1.50*

```sh
export DEVICE_TOKEN=your_device_token
mosquitto_pub -q 1 -d -t "devices/$DEVICE_TOKEN/diagnostics" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN" \
              -m '{"payload":{"CPU Temperature":41,"IP Address":"192.168.1.50"}}'
```

!!! Note
    Replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

# Commands Stream

Receive commands sent from the [Control Panels](https://cloud4rpi.io/control-panels) in real time by subscribing to the following topic:

```gradle
devices/{token}/commands
```

### Topic Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token


## Example

Execute the following command to subscribe:

```sh
export DEVICE_TOKEN=your_device_token
mosquitto_sub -d -t "devices/$DEVICE_TOKEN/commands" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN"
```

This program works in the foreground and blocks the input while the connection to the broker persists. So, you instantly get commands sent from the UI in the following format:


## Message Structure

```javascript
{var_name:var_new_value}
```

### Parameters

Name               | Description        | Type             | Possible Values
------------------ | ------------------ | ---------------- | ----------------
var_name           | Variable name      | string           | Any
var_new_value      | New variable value | corresponding    | Any
