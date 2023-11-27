FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
	wget \
	git \
	xz-utils \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -U -G sudo -p '' -m builder && \
	mkdir -p /opt/source && \
	chown builder /opt/source/

# Fetch everything in /opt/sources
ENV ALLEG_VER 5.2.9.0
USER builder
WORKDIR /opt/source
RUN wget http://zlib.net/zlib-1.2.12.tar.gz -O- | tar xfz -
RUN wget http://downloads.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.gz -O- | tar xfz -
RUN wget http://downloads.sourceforge.net/project/freetype/freetype2/2.12.1/freetype-2.12.1.tar.gz -O- | tar xfz -
RUN wget https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz -O- | tar xfz -
RUN wget https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.gz -O- | tar xfz -
RUN git clone https://github.com/kode54/dumb.git --depth 1 && rm -rf dumb/.git
RUN wget https://ftp.osuosl.org/pub/xiph/releases/flac/flac-1.3.4.tar.xz -O- | tar xfJ -
RUN git clone https://github.com/lieff/minimp3.git --depth 1 && rm -rf minimp3/.git
RUN wget https://github.com/icculus/physfs/archive/refs/tags/release-3.0.2.tar.gz -O- | tar xfz -
RUN git clone https://github.com/liballeg/allegro5.git --branch $ALLEG_VER --depth 1 && rm -rf allegro5/.git

# All downloads complete. Start second stage.
FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive
ENV ALLEG_VER 5.2.9.0

RUN useradd -U -G sudo -p '' -m builder && \
	apt-get update && apt-get -y install \
	pkg-config \
	cmake \
	sudo \
	patch \
	# To save space, we only install the 32-bit i686 packages
	# This saves ~500s Mbs in the final docker image.
	# Alternatively, get mingw-w64 (both 32-bit and 64-bit)
	# or choose the -x86-64 or -i686 packages
	gcc-mingw-w64-i686 \
	g++-mingw-w64-i686 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=0 /opt/ /opt/

USER builder

COPY scripts/* /opt/source/

RUN /opt/source/build-zlib.sh && \
 /opt/source/build-png.sh && \
 /opt/source/build-freetype.sh && \
 /opt/source/build-ogg.sh && \
 /opt/source/build-vorbis.sh && \
 /opt/source/build-dumb.sh && \
 /opt/source/install-minimp3.sh && \
 /opt/source/build-flac.sh && \
 /opt/source/build-physfs.sh

# COPY scripts/build-theora.sh /opt/source/

# # TODO: script broken still...
# # Theora - for video support
# # RUN ./build-theora.sh

# # TODO: 
# # FreeImage, webp - for webp support
# # Opus
# # physFS

RUN cd /opt/source/allegro5 && \
	/opt/source/build-alleg5-mingw-monolith.sh && \
	/opt/source/build-alleg5-mingw-release.sh && \
	/opt/source/build-alleg5-mingw-debug.sh && \
	/opt/source/build-alleg5-mingw-debug-monolith.sh && \
	/opt/source/build-alleg5-mingw-static.sh && \
	rm -rf /opt/source/allegro5/Build

VOLUME /data
WORKDIR /data

# This is where pkg-config will find .pc files for allegro and other deps.
ENV PKG_CONFIG_LIBDIR=/usr/i686-w64-mingw32/lib/pkgconfig

CMD /bin/bash
