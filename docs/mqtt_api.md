# Prerequisites

The examples in this section are presented for the [Eclipse Mosquitto™](https://mosquitto.org/) MQTT client. Execute the following command to run them:

```bash
sudo apt-get install mosquitto-clients
```

# Cloud4RPI MQTT Broker

Use the following data to connect to the MQTT broker:

* **Address:** `mq.cloud4rpi.io`
* **Port:** `1883`
* **Client ID**: Your [Device](https://cloud4rpi.io/devices/) Token


!!! Warning
    Since the **Client ID** is used for authentication, you should not open more than one connection to the MQTT broker at the same time.

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

```json
{
    "ts": datetime_isoformat,
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
datetime_isoformat | Timestamp     | string | Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly.
name               | Variable name | string | Any string
type               | Variable type | string | "bool", "numeric" or "string"


## Example

The following example creates two variables on the device:

* **Temperature** (numeric)
* **LEDOn** (boolean)


```bash
export DEVICE_TOKEN=your_device_token
mosquitto_pub -d -t "devices/$DEVICE_TOKEN/config" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN" \
              -m '{"ts":"$(date -Is)","payload":[{"name":"Temperature","type":"numeric"},{"name":"LEDOn","type":"bool"}]}'
```


!!! Note
    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

# Variable Values

Send messages with your variable values to the following topic:

```gradle
devices/{token}/data
```

### Topic Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token



## Message Structure

```json
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

Name               | Description    | Type          | Possible Values
------------------ | -------------  | ------------- | ----------------------------
datetime_isoformat | Timestamp      | string        | Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly
var_name           | Variable name  | string        | One of the variables
var_value          | Variable value | corresponding | Any


## Example

The following example sends the values of two variables:

* **Temperature**: *24*
* **LEDOn**: *true*

```bash
export DEVICE_TOKEN=your_device_token
mosquitto_pub -d -t "devices/$DEVICE_TOKEN/data" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN" \
              -m '{"ts":"$(date -Is)","payload":{"Temperature":24,"LEDOn":true}}'
```

!!! Note
    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).


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

```json
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

Name               | Description    | Type   | Possible Values
------------------ | -------------  | ------ | ----------------------------
datetime_isoformat | Timestamp      | string | Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly
var_name           | Variable name  | string | Any
var_value          | Variable value | any    | Any


## Example

The following example sends the following diagnostic values to Cloud4RPI:

* **CPU Temperature**: *41*
* **IP Address**: *192.168.1.50*

```bash
export DEVICE_TOKEN=your_device_token
mosquitto_pub -d -t "devices/$DEVICE_TOKEN/diagnostics" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN" \
              -m '{"ts":"$(date -Is)","payload":{"CPU Temperature":41,"IP Address":"192.168.1.50"}}'
```

!!! Note
    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

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

```bash
export DEVICE_TOKEN=your_device_token
mosquitto_sub -d -t "devices/$DEVICE_TOKEN/commands" -h mq.cloud4rpi.io -i "$DEVICE_TOKEN"
```

This program works in the foreground and blocks the input while the connection to the broker persists. So, you instantly get commands sent from the UI in the following format:


## Message Structure

```json
{var_name:var_new_value}
```

### Parameters

Name               | Description        | Type             | Possible Values
------------------ | ------------------ | ---------------- | ----------------
var_name           | Variable name      | string           | Any
var_new_value      | New variable value | corresponding    | Any
