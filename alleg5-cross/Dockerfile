FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
	cmake \
	# pkg-config \

	# Needed for i686-w64-mingw32-pkg-config 
	mingw-w64-tools dpkg-dev \
	wget \
	# make \
	# gcc \
	# g++ \
	git \
	sudo \
	mingw-w64

#	texinfo \
#	libxext-dev \
#	libx11-dev \
#	libxpm-dev \
#	libxt-dev \
#	libxcursor-dev \
#	libasound2-dev \
#	oss4-dev \
#	libxxf86dga-dev \
#	libxxf86vm-dev \
#	libgl1-mesa-dev \
#	libglu1-mesa-dev \


RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 5.2.7.0
USER builder
WORKDIR /home/builder

RUN git clone https://github.com/liballeg/allegro5.git --branch $ALLEG_VER --depth 1

COPY scripts /home/builder

RUN ./build-zlib.sh
RUN ./build-png.sh
RUN ./build-freetype.sh
RUN ./build-ogg.sh
RUN ./build-vorbis.sh

# TODO: 
# FreeImage, webp - for webp support
# Theora - for video support
# FLAC
# Dumb
# Opus
# minimp3

# Non-allegro...
# libcurl

RUN bash -c 'mkdir -p /home/builder/allegro5/Build/{MingwDebug,MingwRelease,MingwMonolith}'

WORKDIR /home/builder/allegro5/Build/MingwDebug
RUN cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DCMAKE_BUILD_TYPE=Debug \
	-DWANT_DEMO=off \
	-DWANT_EXAMPLES=off \
	-DWANT_DOCS=off \
	../.. && make
USER root
RUN make install && ldconfig
USER builder

WORKDIR /home/builder/allegro5/Build/MingwRelease
RUN cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DWANT_DEMO=off \
	-DWANT_EXAMPLES=off \
	-DWANT_DOCS=off \
	../.. && make
USER root
RUN make install && ldconfig
USER builder

WORKDIR /home/builder/allegro5/Build/MingwMonolith
RUN cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DWANT_MONOLITH=on \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DWANT_DEMO=off \
	-DWANT_EXAMPLES=off \
	-DWANT_DOCS=off \
	../.. && make
USER root
RUN make install && ldconfig
USER builder

VOLUME /data
WORKDIR /data

CMD /bin/bash
