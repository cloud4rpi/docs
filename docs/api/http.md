# Variables Configuration

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
or
```javascript
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
name               | Variable name | string | Any string
type               | Variable type | string | "bool", "numeric" or "string"


## Example

The following example creates two variables on the device:

* **Temperature** (numeric)
* **LEDOn** (boolean)


```sh
export DEVICE_TOKEN=your_device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '[{"name":"Temperature","type":"numeric"},{"name":"LEDOn","type":"bool"}]' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/config
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

## Response Body

```javascript
{ "message": "OK" }
```
or
```javascript
{ "error": error_text }
```

# Variable Values

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

Name               | Description    | Type          | Possible Values
------------------ | -------------  | ------------- | ----------------------------
datetime_isoformat | Timestamp      | string        | Optional. Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly
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
     -d '{"ts":"$(date -Is)","payload":{"Temperature":24,"LEDOn":true}}' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/data
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

## Response Body

```javascript
{ "message": "OK" }
```
or
```javascript
{ "error": error_text }
```


# Diagnostic Data

Sends device's diagnostic data.

## Request Destination

* **Method**: POST
* **URL**: `https://cloud4rpi.io/api/devices/{token}/diagnostics`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

### Headers

```
Content-Type: application/json
```

## Request Body

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

Name               | Description    | Type   | Possible Values
------------------ | -------------  | ------ | ----------------------------
datetime_isoformat | Timestamp      | string | Optional. Time in the **ISO 8601** format with the [time zone designator](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators) specified explicitly
var_name           | Variable name  | string | Any
var_value          | Variable value | any    | Any


## Example

The following example sends the following diagnostic values to Cloud4RPi:

* **CPU Temperature**: *41*
* **IP Address**: *192.168.1.50*

```sh
export DEVICE_TOKEN=your_device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"ts":"$(date -Is)","payload":{"CPU Temperature":41,"IP Address":"192.168.1.50"}}' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/diagnostics
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

## Response Body

```javascript
{ "message": "OK" }
```
or
```javascript
{ "error": error_text }
```


# Commands Queue

Acquires the recent commands sent from the Control Panel.

## Request Destination

* **Method**: GET
* **URL**: `https://cloud4rpi.io/api/devices/{token}/commands/latest`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token



## Example

```sh
export DEVICE_TOKEN=your_device_token

curl -X GET http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/commands/latest
```

## Response Body

```javascript
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


The commands are in chronological order.
