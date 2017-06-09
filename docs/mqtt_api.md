# Cloud4RPI MQTT Broker

* **Address:** `mq.cloud4rpi.io`
* **Port:** `1883`
* **Cluent ID**: Your [Device](https://cloud4rpi.io/devices/) Token

!!! Note

    **Login** and **Password** are not used, you can leave them empty.

# Variables Configuration

* **Topic:** `devices/{token}/config`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

# Variable Values

* **Topic:** `devices/{token}/data`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

# Diagnostic Data

* **Topic:** `devices/{token}/system`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token

# Commands Stream

* **Topic:** `devices/{token}/cmd`

### URL Parameters

Name      | Description
--------- | -----------------------
token     | The [device](https://cloud4rpi.io/devices) token
