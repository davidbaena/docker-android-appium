# docker-android-appium
Repository for automated builds of appium server container.

This container can be used as jenkins-slave for your automated tests.

# Software included
- Maven3
- jdk8
- appium 1.4.10
- android android-sdk_r24.1.2
- android build-tools-22.0.1

## Just 1 appium server
Run container with usb privileges to find the phisical device
```
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb  -p 4723:4723 davidbaena/appium
```
## More than 1 appium server
Start 2 appium servers with diferents configurations. [Check appium Doc.](https://github.com/appium/appium/blob/master/docs/en/appium-setup/parallel_tests.md)
- '-p' port: the main Appium port
- '-bp' bootstrap port: the device id
- '-U' UDID: the Appium bootstrap port

```
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb -e appium_args="-p 4723 -bp 2251 -U 32456"  -p 4723:4723 davidbaena/appium

$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb -e appium_args="-p 4724 -bp 2252 -U 43364" -p 4724:4724 davidbaena/appium

```
