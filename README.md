# docker-android-appium
Repository for automated builds of appium server container.

This container can be used as jenkins-slave for your automated tests.

# Software available
- Maven3
- jdk8
- appium 1.4.1
- android android-sdk_r24.1.2
- android build-tools-22.0.1

# Run
Run container with usb privileges to find the phisical device
```sh
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb  -p 4723:4723 davidbaena/appium
```
