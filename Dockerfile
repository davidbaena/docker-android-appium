FROM codetroopers/jenkins-slave-jdk8-android:22-22.0.1-x86

MAINTAINER davidbaena

RUN apt-get update
RUN apt-get -y install curl build-essential

#Install maven
RUN apt-get install -y maven

USER jenkins
WORKDIR /home/jenkins

RUN  mkdir .local && mkdir node
RUN curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
RUN ./configure --prefix=.local && make install

ENV NODE_PATH=/home/jenkins/.local/lib/node_modules
ENV PATH=/home/jenkins/.local/bin:$PATH


USER root
# Expose bin to default nodejs bin for sublime plugins
RUN ln -s /home/jenkins/.local/bin/node  /usr/bin/nodejs
RUN ln -s /home/jenkins/.local/lib/node_modules /usr/local/lib/

ENV appium_version 1.4.2
ENV appium_args "-p 4723"

USER jenkins
#Install npm
RUN curl -O https://npmjs.com/install.sh | sh

#Install appium
RUN npm install -g appium@${appium_version}

USER root
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord"]
