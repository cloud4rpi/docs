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

## Type Error during setup requirements

``` bash
$ sudo pip install -r requirements.txt
Downloading/unpacking axel (from -r requirements.txt (line 1))
Cleaning up...
Exception:
Traceback (most recent call last):
  File "/usr/lib/python2.7/dist-packages/pip/basecommand.py", line 122, in main
    status = self.run(options, args)
  File "/usr/lib/python2.7/dist-packages/pip/commands/install.py", line 290, in run
    requirement_set.prepare_files(finder, force_root_egg_info=self.bundle, bundle=self.bundle)
  File "/usr/lib/python2.7/dist-packages/pip/req.py", line 1178, in prepare_files
    url = finder.find_requirement(req_to_install, upgrade=self.upgrade)
  File "/usr/lib/python2.7/dist-packages/pip/index.py", line 194, in find_requirement
    page = self._get_page(main_index_url, req)
  File "/usr/lib/python2.7/dist-packages/pip/index.py", line 568, in _get_page
    session=self.session,
  File "/usr/lib/python2.7/dist-packages/pip/index.py", line 694, in get_page
    req, link, "connection error: %s" % exc, url,
TypeError: __str__ returned non-string (type Error)
```
Set correct date and time on your RaspberryPi device.

## Where can I find .log file for service?

Default path for log file is *'/var/log/cloud4rpi.log'*

You can configure the logging parameters in the **app.py**.

To specify .log file location change path constant to required path:

```LOG_FILE_PATH = '/var/log/cloud4rpi.log'```

To get more detailed log information uncomment line below to set DEBUG logger level:

```# c4r.set_logger_level(logging.DEBUG)  # uncomment to show debug messages```