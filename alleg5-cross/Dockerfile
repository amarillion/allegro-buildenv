FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
	cmake \
	wget \
	git \
	sudo \
	# To save space, we only install the 32-bit i686 packages
	# This saves ~500s Mbs in the final docker image.
	# Alternatively, get mingw-w64 (both 32-bit and 64-bit)
	# or choose the -x86-64 or -i686 packages
	gcc-mingw-w64-i686 \
	g++-mingw-w64-i686

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

# Clean up intermediate build files to save size
# RUN bash -c 'rm -r /home/builder/allegro5/Build/{MingwDebug,MingwRelease,MingwMonolith}'

VOLUME /data
WORKDIR /data

CMD /bin/bash
