# HTTP API

## Update Config

Updates the device's configuration.

```
Request URL: https://cloud4rpi.io/api/devices/{token}/config/update
Request Method: POST
Content-Type: application/json
Returns: application/json
```

### Request URL Parameters

Parameter | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

### Request Data Format

```json
["TODO"]
```

### Example

The following example creates two variables on the device:

* **Temperature** of the numeric type.
* **LEDOn** of the boolean type.

#### Request

```bash
export DEVICE_TOKEN=your_device_token

curl -X POST \
     -H "Content-Type: application/json" \
     -d '[{"name":"Temperature","type":"numeric"},{"name":"LEDOn","type":"bool"}]' \
     http://cloud4rpi.io/api/devices/${DEVICE_TOKEN}/config/update
```

!!! Note

    You need to replace **your_device_token** with your device token displayed on the [device page](https://cloud4rpi.io/devices).

#### Response

```json
["TODO"]
```

<!-- TODO: Process other methods -->

## Send data

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
