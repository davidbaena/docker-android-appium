# docker-android-appium
Repository for automated builds of appium server container
# Run
Run container with usb privileges to find the phisical device
```sh
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb  -p 4723:4723 davidbaena/appium bash
```
