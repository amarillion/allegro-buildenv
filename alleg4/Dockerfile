FROM ubuntu:xenial

RUN apt-get update
RUN apt-get -y install cmake \
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
	sudo

RUN useradd -U -G sudo -p '' -m builder

ENV ALLEG_VER 4.4.2
USER builder
WORKDIR /home/builder
RUN wget -q http://download.gna.org/allegro/allegro/$ALLEG_VER/allegro-$ALLEG_VER.tar.gz 
RUN tar -zxf allegro-$ALLEG_VER.tar.gz

WORKDIR /home/builder/allegro-$ALLEG_VER
# Fix a compilation bug
RUN wget -q -O - https://sourceforge.net/p/alleg/bugs/398/attachment/50_fix_get_value_gcc_5.patch | patch -p1

RUN mkdir -p /home/builder/allegro-$ALLEG_VER/Build/Debug
WORKDIR /home/builder/allegro-${ALLEG_VER}/Build/Debug
RUN cmake -DCMAKE_BUILD_TYPE=Debug ../.. && make
USER root
RUN make install
USER builder

RUN mkdir -p /home/builder/allegro-${ALLEG_VER}/Build/Release
WORKDIR /home/builder/allegro-${ALLEG_VER}/Build/Release
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ../.. && make
USER root
RUN make install
USER builder

USER root
RUN apt-get -y install subversion
USER builder
WORKDIR /home/builder
RUN svn checkout svn://svn.code.sf.net/p/alfont/code/trunk alfont
WORKDIR /home/builder/alfont

VOLUME /data
WORKDIR /data

CMD /bin/bash
