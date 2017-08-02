Frequently asked questions and possible issues you may face when working with [Cloud4RPi](https://cloud4rpi.io):

## How to avoid Installation Error?

You can get the following error while installing the Cloud4RPi client library using the `sudo pip install cloud4rpi` command:

```
InstallationError: Command "python setup.py egg_info" failed with error code 1
```

This happens because the **setuptools** package your Python interpreter uses is outdated. Update the package with the following command:

```sh
sudo pip install --upgrade setuptools
```

After updating, restart the **cloud4rpi** package installation:

```sh
sudo pip install cloud4rpi
```

## How to avoid "Insecure Platform" warning?

The `InsecurePlatformWarning: A true SSLContext object is not available...` notification appears when you run Cloud4RPi on Python version lower than 2.7.9. Check your current Python version using the following command:

```sh
python --version
```

If the version of Python is lower than 2.7.9, install the latest version using one of the [following ways](https://docs.python.org/2/using/index.html).

## Where are log files?

You can read the logs containing the service's output and errors using one of the following commands:

* `less /var/log/cloud4rpi.log` — if your init manager is `init` and you have not changed the [log path](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh#L54);
* `sudo journalctl -u cloud4rpi` — if your init manager is `systemd` and you have not changed the [service name](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh#L151).


!!! Note
    Use the `ps -p 1` command to see the init manager of your operating system. If it differs from `init` and `systemd`, refer to the documentation for your init manager to learn about its logging capabilities.

You can also call the following function at the beginning of your script to have the script output saved to file. It is useful if you do not run your Cloud4RPi-enabled script as a service:

```python
cloud4rpi.set_logging_to_file(YOUR_LOGFILE_PATH)
```

## How to update Cloud4RPi client installation?

The Cloud4RPi client library is a [PyPI package](https://pypi.python.org/pypi/cloud4rpi), managed by the [pip utility](https://pip.pypa.io/en/stable/). Execute the following command to update the Cloud4RPi client library:

```sh
sudo pip install --upgrade cloud4rpi
```
