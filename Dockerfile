FROM gfx2015/android:latest

MAINTAINER baena

ENV appium_version 1.4.1

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install libc6:i386 libstdc++6:i386

RUN curl -sL https://deb.nodesource.com/setup_0.12 |  bash -
RUN apt-get install -y nodejs

RUN curl -L https://npmjs.com/install.sh | sh

RUN npm install -g appium-version-manager

RUN avm ${appium_version}

EXPOSE 4723
run adb devices
CMD /usr/local/avm/versions/${appium_version}/node_modules/appium/bin/appium.js
