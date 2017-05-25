FROM ubuntu:xenial

RUN apt-get update && apt-get -y install curl \
	git \
	wget \
	unzip

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 5.2.2.0
USER builder
WORKDIR /home/builder

RUN curl https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xz
RUN wget https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip && unzip android-ndk-r12b-linux-x86_64.zip
RUN curl http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz | tar xz

#RUN git clone https://github.com/liballeg/allegro5.git --branch $ALLEG_VER --depth 1
#RUN bash -c 'mkdir -p /home/builder/allegro5/Build/{Android-Debug,Android-Release}'
#VOLUME /data
#WORKDIR /data
#CMD /bin/bash
