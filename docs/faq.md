Frequently Asked Questions and common issues that that you may face when working with [Cloud4RPi](https://cloud4rpi.io):

# Failure when installing Cloud4RPi using pip

On some platforms, you can get the following error when running the `sudo pip install cloud4rpi` command:

```
InstallationError: Command "python setup.py egg_info" failed with error code 1
```

It happens because the `setuptools` package used by your Python interpreter is outdated. Update it with the following command and try installing **cloud4rpi** again:

```sh
sudo pip install --upgrade setuptools
sudo pip install cloud4rpi
```

# Insecure platform warning

If you get the `InsecurePlatformWarning: A true SSLContext object is not available...` error, you need to have Python version 2.7.9 or higher installed. Please check your current Python version with the following command:

```sh
python --version
```

If your Python version is lower than 2.7.9 setup the new python using one of the [official ways](https://docs.python.org/2/using/index.html).

# Where are the log files?

If you have your script installed as a service using our [service_install.sh](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh) script, you can read the logs with service's output and errors using one of the following command:

* `less /var/log/cloud4rpi.log` — if your init manager is `init` and you have left the [log path](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh#L54) unchanged;
* `sudo journalctl -u cloud4rpi` — if your init manager is `systemd`.
