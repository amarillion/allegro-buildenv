FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
	pkg-config \
	cmake \
	wget \
	git \
	sudo \
	# To save space, we only install the 32-bit i686 packages
	# This saves ~500s Mbs in the final docker image.
	# Alternatively, get mingw-w64 (both 32-bit and 64-bit)
	# or choose the -x86-64 or -i686 packages
	gcc-mingw-w64-i686 \
	g++-mingw-w64-i686 \
	&& rm -rf /var/lib/apt/lists/*

RUN useradd -U -G sudo -p '' -m builder && \
	mkdir -p /opt/source && \
	chown builder /opt/source/

ENV ALLEG_VER 5.2.7.0
USER builder

COPY scripts/build-zlib.sh \
	scripts/build-png.sh \
	scripts/build-freetype.sh \
	scripts/build-ogg.sh \
	scripts/build-vorbis.sh \
	scripts/build-dumb.sh \
	scripts/Toolchain-mingw.cmake \
	scripts/install-minimp3.sh \
	scripts/build-flac.sh \
	scripts/build-physfs.sh \
	/opt/source/

RUN cd /opt/source && \
	git clone https://github.com/liballeg/allegro5.git --branch $ALLEG_VER --depth 1 && \
	./build-zlib.sh && \
	./build-png.sh && \
	./build-freetype.sh && \
	./build-ogg.sh && \
	./build-vorbis.sh && \
	./build-dumb.sh && \
	./install-minimp3.sh && \
	./build-flac.sh && \
	./build-physfs.sh

COPY scripts/build-theora.sh /opt/source/

# TODO: script broken still...
# Theora - for video support
# RUN ./build-theora.sh

# TODO: 
# FreeImage, webp - for webp support
# Opus
# physFS

COPY scripts/build-alleg5-mingw*.sh /opt/source/

RUN cd /opt/source/allegro5 && \
	/opt/source/build-alleg5-mingw-monolith.sh && \
	/opt/source/build-alleg5-mingw-release.sh && \
	/opt/source/build-alleg5-mingw-debug.sh && \
	/opt/source/build-alleg5-mingw-static.sh && \
	rm -rf /opt/source/allegro5/Build

VOLUME /data
WORKDIR /data

# This is where pkg-config will find .pc files for allegro and other deps.
ENV PKG_CONFIG_LIBDIR=/usr/i686-w64-mingw32/lib/pkgconfig

CMD /bin/bash
