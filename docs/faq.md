# FAQ

Frequently Asked Questions when working with Cloud4Rpi

## Insecure Platform Warning

Error `"InsecurePlatformWarning: A true SSLContext object is not available..."`

You need Python version 2.7.9 or higher installed. Please check it with

``` bash
$ python --version
```

and update if necessary.

``` bash
$ wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
$ gunzip Python-2.7.9.tgz
$ tar -xvf Python-2.7.9.tar
$ cd Python-2.7.9/
$ ./configure
$ make
$ sudo make install
```

## Where can I find .log file for service?

Default path for log file is *'/var/log/cloud4rpi.log'*

You can configure the logging parameters in the **app.py**.

To specify .log file location change path constant to required path:

```LOG_FILE_PATH = '/var/log/cloud4rpi.log'```

To get more detailed log information uncomment line below to set DEBUG logger level:

```# c4r.set_logger_level(logging.DEBUG)  # uncomment to show debug messages```