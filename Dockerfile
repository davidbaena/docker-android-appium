FROM codetroopers/jenkins-slave-jdk8-android:22-22.0.1-x86

MAINTAINER baena

ENV appium_version 1.4.1

RUN apt-get update
RUN apt-get -y install curl

#Install node 0.12
RUN curl -sL https://deb.nodesource.com/setup_0.12 |  bash -
RUN apt-get install -y nodejs

#Install maven
RUN apt-get install -y maven

#Install npm
RUN curl -L https://npmjs.com/install.sh | sh

#Install avm
RUN npm install -g appium-version-manager

#Install version of appium
RUN avm ${appium_version}

EXPOSE 4723
CMD /usr/local/avm/versions/${appium_version}/node_modules/appium/bin/appium.js
