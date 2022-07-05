FROM ubuntu:jammy

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
	wget \
	make \
	gcc \
	g++ \
	sudo \
	&& rm -rf /var/lib/apt/lists/*

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 4.4.3.1
USER builder
WORKDIR /home/builder
RUN wget -q -O - https://github.com/liballeg/allegro5/releases/download/$ALLEG_VER/allegro-$ALLEG_VER.tar.gz | tar -zx

WORKDIR /home/builder/allegro-$ALLEG_VER
RUN bash -c 'mkdir -p /home/builder/allegro-${ALLEG_VER}/Build/{Debug,Release}'

WORKDIR /home/builder/allegro-${ALLEG_VER}/Build/Debug
RUN cmake -DCMAKE_BUILD_TYPE=Debug -DWANT_DOCS=off -DWANT_EXAMPLES=off -DWANT_DEMO=off ../.. && make
USER root
RUN make install && ldconfig
USER builder

WORKDIR /home/builder/allegro-${ALLEG_VER}/Build/Release
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_DOCS=off -DWANT_EXAMPLES=off -DWANT_DEMO=off ../.. && make
USER root
RUN make install && ldconfig
USER builder

VOLUME /data
WORKDIR /data

CMD /bin/bash
