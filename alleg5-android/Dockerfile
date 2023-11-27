FROM ubuntu:focal

RUN apt-get update && apt-get -y install curl \
	git \
	wget \
	unzip

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 5.2.9.0
USER builder
WORKDIR /home/builder

RUN curl https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xz
RUN wget https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip && unzip android-ndk-r12b-linux-x86_64.zip

# NOTE: java url needs updating frequently. See:  https://stackoverflow.com/questions/10268583/
RUN curl -L -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz" | tar xz

ENV	JAVA_HOME=/home/builder/jdk-8u102-linux-x64 \
	PATH=${PATH}:/home/builder/jdk1.8.0_131/bin/:/home/builder/android-sdk-linux/tools:/home/builder/android-ndk-linux \
	ANDROID_NDK_ROOT=/home/builder/android-ndk-linux

RUN echo y | android update sdk -u -a -t platform-tools && \
	echo y | android update sdk -u -a -t build-tools-24.0.2  && \
	echo y | android update sdk -u -a -t android-24 && \
	echo y | android update sdk -u -a -t extra-android-m2repository 


RUN wget http://download.savannah.gnu.org/releases/freetype/freetype-2.7.tar.bz2
RUN wget http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.xz
RUN wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.xz

USER root
RUN apt-get -y install bzip2 python gcc sudo xz-utils cmake
USER builder

COPY compile-deps.sh /home/builder

RUN ARCH=armeabi-v7a ./compile-deps.sh
#RUN ARCH=armeabi ./compile-deps.sh
RUN ARCH=x86 ./compile-deps.sh 
RUN ARCH=x86_64 ./compile-deps.sh
#RUN ARCH=arm64-v8a ./compile-deps.sh
#RUN ARCH=mips ./compile-deps.sh
#RUN ARCH=mips64 ./compile-deps.sh

COPY compile-allegro.sh /home/builder

VOLUME /home/builder/allegro
WORKDIR /home/builder
CMD /bin/bash
