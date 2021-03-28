FROM ubuntu:focal

# https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get -y install \
	cmake \
	g++ \
	gcc \
	git \
	libasound-dev \
	libasound2-dev \
	libdumb1-dev \
	libflac-dev \
	libfreeimage-dev \
	libfreetype6-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	libgtk-3-dev \
	libjpeg-dev \
	libogg-dev \
	libopenal-dev \
	libopus-dev \
	libopusfile-dev \
	libphysfs-dev \
	libpng-dev \
	libpulse-dev \
	libtheora-dev \
	libvorbis-dev \
	libwebp-dev \
	libx11-dev \
	libxcursor-dev \
	libxext-dev \
	libxpm-dev \
	libxt-dev \
	libxxf86dga-dev \
	libxxf86vm-dev \
	make \
	oss4-dev \
	pkg-config \
	sudo \
	zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 5.2.7.0
USER builder
WORKDIR /home/builder

COPY scripts /home/builder

RUN ./install-minimp3.sh && \
	git clone https://github.com/liballeg/allegro5.git --branch $ALLEG_VER --depth 1 && \
	cd allegro5 && \
	~/build-alleg5-debug.sh && \
	~/build-alleg5-release.sh && \
	~/build-alleg5-monolith.sh && \
	~/build-alleg5-static.sh && \
	rm -rf /home/builder/allegro5

VOLUME /data
WORKDIR /data

CMD /bin/bash
