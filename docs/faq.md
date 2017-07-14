Frequently Asked Questions and possible issues you may face when working with [Cloud4RPi](https://cloud4rpi.io):

# Cloud4RPi installation failure when using pip

On some platforms, you can get the following error when running the `sudo pip install cloud4rpi` command:

```
InstallationError: Command "python setup.py egg_info" failed with error code 1
```

This happens because the `setuptools` package your Python interpreter uses is outdated. Update it with the following command and reinstall **cloud4rpi**:

```sh
sudo pip install --upgrade setuptools
sudo pip install cloud4rpi
```

# Insecure platform warning

You need to have Python version 2.7.9 or higher installed if you get the `InsecurePlatformWarning: A true SSLContext object is not available...` error. Check your current Python version using the following command:

```sh
python --version
```

If your Python version is lower than 2.7.9, install the new version using one of the [following ways](https://docs.python.org/2/using/index.html).

# Where are the log files?

You can read the logs with the service's output and errors using one of the following commands if you have your script uses our [service_install.sh](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh) script:

* `less /var/log/cloud4rpi.log` — if your init manager is `init` and you have not changed the [log path](https://github.com/cloud4rpi/cloud4rpi/blob/master/service_install.sh#L54);
* `sudo journalctl -u cloud4rpi` — if your init manager is `systemd`.
