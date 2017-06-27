# pointcoin-app-base image, should refer to  pointcoin-app-base-<version>
# For example FROM kevinwangcy/upchain:pointcoin-app-base-latest

FROM phusion/baseimage:0.9.22
MAINTAINER Kevin C.Y. Wang <kevin.wang.cy@gmail.com>

# Upgrade OS, Install OpenJDK 8 & bzip2
RUN add-apt-repository ppa:openjdk-r/ppa -y && apt-get update -y && \
    apt-get install -y --no-install-recommends openjdk-8-jdk bzip2 libevent-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Jasypt Tools
ARG JASYPT_NAME=jasypt-1.9.2
ARG JASYPT_FILE=jasypt-1.9.2.tar.gz
ARG JASYPT_URL=https://raw.githubusercontent.com/kevin-wang-cy/pointcoin-resource/master/jasypt/$JASYPT_FILE

RUN curl -L -o /tmp/$JASYPT_FILE $JASYPT_URL && \
    tar -C /tmp -zxvf /tmp/$JASYPT_FILE && \
    chmod -R 700 /tmp/$JASYPT_NAME/bin && \
    mkdir -p /opt/pointcoin && \
    cp -R /tmp/$JASYPT_NAME /opt/pointcoin && \
    ln -s /opt/pointcoin/$JASYPT_NAME /opt/pointcoin/jasypt && \
    rm -rf /tmp/* /var/tmp/*

# Install En/Decrypt Scripts
ADD . /tmp/docker_build
RUN chmod -R 700 /tmp/docker_build/jasypt && \
    cp -R /tmp/docker_build/jasypt/** /opt/pointcoin/jasypt && \
    ln -s /opt/pointcoin/jasypt/encrypt.sh /usr/bin/encrypt && \
    ln -s /opt/pointcoin/jasypt/decrypt.sh /usr/bin/decrypt && \
    ln -s /opt/pointcoin/jasypt/digest.sh /usr/bin/digest && \
    rm -rf /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
