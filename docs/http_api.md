# Update Config

Updates the device's configuration.

## Request Destination

* **Method**: POST
* **URL**: `https://cloud4rpi.io/api/devices/{token}/config`

### URL Parameters

Parameter | Description
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

### Variables

Variable | Description | Type | Possible Values
-------- | ----------- | ---- | ---------------
datetime_isoformat | Timestamp | string | Time in **ISO 8601** format.
name | Variable name | string | Any string
type | Variable type | string | "bool", "numeric" or "string"


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

Sends device data.

```
POST /api/devices/{token}/stream/data
HTTP/1.1
Host: cloud4rpi.io
Accept: application/json
Content-Type: application/json
```

### Path parameters

Parameter | Description
--------- | -----------------------
token     | The token of the device

The following example sends the Temperature and LEDOn values to cloud4rpi.

```bash
export DEVICE_TOKEN=device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"ts":"2016-11-14T09:59:28.214Z","payload":{"Temperature":24,"LEDOn":false}}' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/stream/data
```

!!! Note

    You need to replace 'device_token' with your device token displayed on the device page.

## Send diagnostic data

Sends diagnostic data.

```
POST /api/devices/{token}/stream/system
HTTP/1.1
Host: cloud4rpi.io
Accept: application/json
Content-Type: application/json
```

### Path parameters

Parameter | Description
--------- | -----------------------
token     | The token of the device

The following example sends the CPU Temperature and IP Address diagnostic values to cloud4rpi.

```bash
export DEVICE_TOKEN=device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '{"ts":"2016-11-14T09:59:28.214Z","payload":{"CPU Temperature":51,"IP Address":"8.8.8.8"}}' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/stream/system
```

!!! Note

    You need to replace 'device_token' with your device token displayed on the device page.
