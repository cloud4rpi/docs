Frequently Asked Questions and possible issues you may face when working with [Cloud4RPi](https://cloud4rpi.io):

# Cloud4RPi installation failure when using pip

On some platforms, you can get the following error when running the `sudo pip install cloud4rpi` command:

```
InstallationError: Command "python setup.py egg_info" failed with error code 1
```

This happens because the `setuptools` package your Python interpreter uses is outdated. Update it with the following command and restart the **cloud4rpi** installation:

```sh
sudo pip install --upgrade setuptools
sudo pip install cloud4rpi
```

# Insecure platform warning

You need to have Python version 2.7.9 or higher installed to avoid getting the `InsecurePlatformWarning: A true SSLContext object is not available...` error. Check your current Python version using the following command:

```sh
python --version
```

If your Python version is lower than 2.7.9, install the new version using one of the [following ways](https://docs.python.org/2/using/index.html).

# Where are the log files?

You can read the logs containing the service's output and errors using one of the following commands:

* `less /var/log/cloud4rpi.log` — if your init manager is `init` and you have not changed the [log path](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh#L54);
* `sudo journalctl -u cloud4rpi` — if your init manager is `systemd` and you have not changed the [service name](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh#L151).


!!! Note
Use the `ps -p 1` command to see the init manager of your operating system. If it differs from `init` and `systemd`, refer to the documentation for your init manager to learn about its logging capabilities.

You can also call the following function at the beginning of your script to have the script output saved to file. It is useful if you do not run your Cloud4RPi-enabled script as a service:

```python
cloud4rpi.set_logging_to_file(LOG_FILE_PATH)
```

# How to update Cloud4RPi client library?

The Cloud4RPi client library is a [PyPI package](https://pypi.python.org/pypi/cloud4rpi), which is managed using the [pip utility](https://pip.pypa.io/en/stable/). Execute the following command to update the Cloud4RPi client library:

```sh
sudo pip install --upgrade cloud4rpi
```
