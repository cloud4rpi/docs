Frequently asked questions and possible issues you may face when working with [Cloud4RPi](https://cloud4rpi.io):

## How to avoid an Installation Error?

You can get the following error while installing the Cloud4RPi client library using the `sudo pip install cloud4rpi` command:

```
InstallationError: Command "python setup.py egg_info" failed with error code 1
```

This happens because the **setuptools** package your Python interpreter uses is outdated. Update the package with the following command:

```sh
sudo pip install --upgrade setuptools
```

After updating, reinstall **cloud4rpi**:

```sh
sudo pip install cloud4rpi
```

## Raspberry Pi does not recognize my 1-Wire device

If you experience issues with the 1-Wire interface on Raspberry Pi, follow the instructions below.

1. Run `sudo raspi-config` and make sure that the 1-Wire interface is enabled (**Interfacing Options** | **1-Wire** menu).
2. Add the `dtoverlay=w1-gpio` string to your `/boot/config.txt` file (`echo dtoverlay=w1-gpio | sudo tee -a /boot/config.txt`).
3. Reboot (`sudo reboot` command).
4. Double-check the wiring and your device's operational voltage. The 1-Wire **DATA** bus should be connected to **GPIO4** (Pin 7) and pulled up to **VCC**.

    ![](/res/ds18b20.png)

## How to avoid the "Insecure Platform" warning?

The `InsecurePlatformWarning: A true SSLContext object is not available...` notification appears when you run Cloud4RPi on a Python version lower than 2.7.9. Check your current Python version with the following command:

```sh
python --version
```

You can install the latest version using [one of the following ways](https://docs.python.org/2/using/index.html).

## Where are the log files?

You can read the logs containing the service's output and errors using one of the following commands:

* `less /var/log/cloud4rpi.log` — if your init manager is `init` and you have left the [service name](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L4) and [log path](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L55) unchanged;
* `sudo journalctl -u cloud4rpi` — if your init manager is `systemd` and you have not changed the [service name](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L4).


!!! Note
    Use the `ps -p 1` command to see your operating system's init manager. If it differs from `init` and `systemd`, refer to the documentation for your init manager to learn about its logging capabilities or [contact us](https://cloud4rpi.answerdesk.io/).

You can also call the following function at the beginning of your script to save the script output. It is useful if you do not run your Cloud4RPi-enabled script as a service:

```python
cloud4rpi.set_logging_to_file(YOUR_LOGFILE_PATH)
```

## How to update Cloud4RPi client installation?

The Cloud4RPi client library is a [PyPI package](https://pypi.python.org/pypi/cloud4rpi), managed by the [pip utility](https://pip.pypa.io/en/stable/). Execute the following command to update the Cloud4RPi client library:

```sh
sudo pip install --upgrade cloud4rpi
```

## How to use the service installed using the service_install.sh script?

The default service's name is **cloud4rpi** (can be changed in [service_install.sh:4](https://gist.github.com/c4r-gists/3bdeff914dd57a26928973656685a503#file-service_install-sh-L4)). If your init manager is `init`, you can use the following commands:

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
