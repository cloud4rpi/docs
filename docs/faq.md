Frequently asked questions and possible issues you can encounter with [Cloud4RPi](https://cloud4rpi.io):


## How to update Cloud4RPi client installation?

The Cloud4RPi client library is a [PyPI package](https://pypi.python.org/pypi/cloud4rpi) the [pip utility](https://pip.pypa.io/en/stable/) manages. Execute the following command to update the Cloud4RPi client library:

```sh
sudo pip install --upgrade cloud4rpi
```


## What are packets?

Packet is a data portion sent from a device to the Cloud4RPi server (using the [MQTT](/api/mqtt/#cloud4rpi-mqtt-broker) or [HTTPs](/api/http/) protocol). A single packet can include multiple variable values. [Diagnostic data](/api/mqtt/#diagnostic-data) transfer is unlimited and does not consume packets.

Packet information is displayed at the top right corner of Cloud4RPi pages and in the **Pricing Plan** category of your [account settings](https://cloud4rpi.io/account).

![](/res/managePackets/packets-info.png)

Learn more about the subscription plans in the [Plans and Pricing](/plans-and-pricing) section.





## Where are the log files?

Use one of the following commands to read the logs containing the service's output and errors:

* `less /var/log/cloud4rpi.log` — if your init manager is `init` and you have left the [service name](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L4) and [log path](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L55) unchanged;
* `sudo journalctl -u cloud4rpi` — if your init manager is `systemd` and you have not changed the [service name](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L4).


!!! Note
    Use the `ps -p 1` command to see your operating system's init manager. Refer to your init manager's documentation for more information or [contact us](https://cloud4rpi.answerdesk.io/) if it differs from `init` and `systemd`.

You can also call the following function at the beginning of your script to save the script output. It is useful if you do not run your Cloud4RPi-enabled script as a service:

```python
cloud4rpi.set_logging_to_file(YOUR_LOGFILE_PATH)
```


## How to use the service installed using the service_install.sh script?

The default service's name is **cloud4rpi** (can be changed in [service_install.sh:4](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L4)). You can use the following commands if your init manager is `init`:

```sh
sudo service cloud4rpi start|stop|status|restart|uninstall
```

If your init manager is `systemd`, you can use the same commands except for `uninstall`. To remove the `systemd` service, execute the following commands:

```sh
sudo systemctl stop cloud4rpi.service
sudo systemctl disable cloud4rpi.service
sudo rm /lib/systemd/system/cloud4rpi.service
sudo systemctl daemon-reload
```


## How to choose the DATA_SENDING_INTERVAL value?

Call [device.publish_data()](/api/python/#publish_data) and [device.publish_diag()](/api/python/#publish_diag) functions frequently to update the monitored variables. The update frequency depends on the variable dynamics, for example, atmospheric conditions do not change every minute. This means the delay between updates for a weather station should be one to ten minutes. You should also consider available [packets](#what-are-packets) when choosing the `DATA_SENDING_INTERVAL` value.

If you monitor several variables with different dynamics, the delay between updates should be the shortest.

!!! Note
    The variable update interval does not affect commands, and variable changes made through the Web UI (**Switch** or **Slider** widget) are applied instantly.


