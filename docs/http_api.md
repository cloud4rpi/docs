# Update Config

Updates the device's configuration.

## Request Destination

* **Method**: POST
* **URL**: `https://cloud4rpi.io/api/devices/{token}/config`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

### Headers

```
Content-Type: application/json
```

## Request Body

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
or
```json
[
    {"name": name, "type": type},
    {"name": name, "type": type},
    // ...
    {"name": name, "type": type}
]
```

### Parameters

Name               | Description   | Type   | Possible Values
------------------ | ------------- | ------ | ----------------------------
datetime_isoformat | Timestamp     | string | Time in **ISO 8601** format.
name               | Variable name | string | Any string
type               | Variable type | string | "bool", "numeric" or "string"


## Example

The following example creates two variables on the device:

* **Temperature** of the numeric type.
* **LEDOn** of the boolean type.


```bash
export DEVICE_TOKEN=your_device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '[{"name":"Temperature","type":"numeric"},{"name":"LEDOn","type":"bool"}]' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/config
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

## Response Body

```json
{ "message": "OK" }
```
or
```json
{ "error": error_text }
```


<!-- TODO: Process other methods -->

# Send Data

Sends variable values.

## Request Destination

* **Method**: POST
* **URL**: `https://cloud4rpi.io/api/devices/{token}/data`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

### Headers

```
Content-Type: application/json
```

## Request Body

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
datetime_isoformat | Timestamp      | string        | Time in **ISO 8601** format.
var_name           | Variable name  | string        | One of the variables
var_value          | Variable value | corresponding | Any


## Example

The following example sends the values of two variables:

* **Temperature**: *24*.
* **LEDOn**: *true*.

```bash
export DEVICE_TOKEN=your_device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"ts":"$(date +%Y-%m-%dT%H:%M:%S%z)","payload":{"Temperature":24,"LEDOn":true}}' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/data
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

## Response Body

```json
{ "message": "OK" }
```
or
```json
{ "error": error_text }
```


# Send Diagnostic Data

Sends diagnostic data.

## Request Destination

* **Method**: POST
* **URL**: `https://cloud4rpi.io/api/devices/{token}/system`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

### Headers

```
Content-Type: application/json
```

## Request Body

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
datetime_isoformat | Timestamp      | string | Time in **ISO 8601** format.
var_name           | Variable name  | string | Any
var_value          | Variable value | any    | Any


## Example

The following example sends the following diagnostic values to Cloud4RPI.

* **CPU Temperature**: *41*
* **IP Address**: *192.168.1.50*

```bash
export DEVICE_TOKEN=your_device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"ts":"$(date +%Y-%m-%dT%H:%M:%S%z)","payload":{"CPU Temperature":41,"IP Address":"192.168.1.50"}}' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/system
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

## Response Body

```json
{ "message": "OK" }
```
or
```json
{ "error": error_text }
```


# Get Commands Queue

Acquires the recent commands sent from the Control Panel.

## Request Destination

* **Method**: GET
* **URL**: `https://cloud4rpi.io/api/devices/{token}/commands/latest`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token



## Example

```bash
export DEVICE_TOKEN=your_device_token

curl -X GET http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/commands/latest
```

## Response Body

```json
[
    {var_name: var_new_value},
    {var_name: var_new_value},
    // ...
    {var_name: var_new_value}
]
```

### Parameters

Name               | Description        | Type             | Possible Values
------------------ | ------------------ | ---------------- | ----------------
var_name           | Variable name      | string           | Any
var_new_value      | New variable value | corresponding    | Any


The commands are ordered chronologically.
