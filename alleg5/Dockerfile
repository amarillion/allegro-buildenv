FROM ubuntu:xenial

RUN apt-get update && apt-get -y install cmake \
	pkg-config \
	texinfo \
	libxext-dev \
	libx11-dev \
	libxpm-dev \
	libxt-dev \
	libxcursor-dev \
	libasound2-dev \
	oss4-dev \
	libxxf86dga-dev \
	libxxf86vm-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	libpng-dev \
	zlib1g-dev \
	libvorbis-dev \
	libogg-dev \
	libphysfs-dev libfreetype6-dev \
	libgtk2.0-dev libdumb1-dev libpulse-dev pandoc \
	libjpeg-dev libopenal-dev libasound-dev libflac-dev libtheora-dev \
	wget \
	make \
	gcc \
	g++ \
	git \
	sudo

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 5.2.2.0
USER builder
WORKDIR /home/builder
RUN git clone https://github.com/liballeg/allegro5.git
WORKDIR /home/builder/allegro5
RUN git checkout $ALLEG_VER -b $ALLEG_VER

RUN mkdir -p /home/builder/allegro5/Build/Debug
WORKDIR /home/builder/allegro5/Build/Debug
RUN cmake -DCMAKE_BUILD_TYPE=Debug ../.. && make
USER root
RUN make install
USER builder

RUN mkdir -p /home/builder/allegro5/Build/Release
WORKDIR /home/builder/allegro5/Build/Release
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ../.. && make
USER root
RUN make install
USER builder

RUN mkdir -p /home/builder/allegro5/Build/Static
WORKDIR /home/builder/allegro5/Build/Static
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_STATIC_RUNTIME=on -DSHARED=off ../.. && make
USER root
RUN make install
USER builder

USER root
RUN ldconfig

RUN apt-get update && apt-get -y install libcurl3-dev

VOLUME /data
WORKDIR /data

CMD /bin/bash

