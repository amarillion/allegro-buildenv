FROM ubuntu:focal

# https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata
ENV DEBIAN_FRONTEND=noninteractive 
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
	libfreeimage-dev libwebp-dev libopus-dev libopusfile-dev libgtk-3-dev \
	wget \
	make \
	gcc \
	g++ \
	git \
	sudo

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 5.2.7.0
USER builder
WORKDIR /home/builder
RUN git clone https://github.com/liballeg/allegro5.git --branch $ALLEG_VER --depth 1

RUN bash -c 'mkdir -p /home/builder/allegro5/Build/{Debug,Release,Monolith,Static}'

WORKDIR /home/builder/allegro5/Build/Debug
RUN cmake -DCMAKE_BUILD_TYPE=Debug -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../.. && make
USER root
RUN make install && ldconfig
USER builder

WORKDIR /home/builder/allegro5/Build/Release
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../.. && make
USER root
RUN make install && ldconfig
USER builder

WORKDIR /home/builder/allegro5/Build/Monolith
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_MONOLITH=on -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../.. && make
USER root
RUN make install && ldconfig
USER builder

WORKDIR /home/builder/allegro5/Build/Static
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_STATIC_RUNTIME=on -DSHARED=off -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../.. && make
USER root
RUN make install && ldconfig
USER builder

VOLUME /data
WORKDIR /data

CMD /bin/bash
