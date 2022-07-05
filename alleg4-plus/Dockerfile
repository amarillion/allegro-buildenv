FROM amarillion/alleg4-buildenv:4.4.3.1-linux 

USER root
RUN apt-get update && apt-get -y install \
	subversion \
	patch \
	git \
	&& rm -rf /var/lib/apt/lists/*
USER builder

WORKDIR /home/builder
RUN  svn checkout https://svn.code.sf.net/p/alfont/code/trunk alfont
WORKDIR /home/builder/alfont
COPY alfont.patch .
RUN patch -p0 < alfont.patch && \
	make TARGET=LINUX_STATIC && \
	sudo make TARGET=LINUX_STATIC install

WORKDIR /home/builder
RUN svn checkout https://svn.code.sf.net/p/masking/code/branches/masking-allegro4 masking && \
	cd masking && \
	./fixlinux.sh && \
	cd src && \
	make && \
	sudo make install

WORKDIR /home/builder
RUN wget -q -O - https://sourceforge.net/projects/dumb/files/dumb/0.9.3/dumb-0.9.3.tar.gz/download | tar xz
COPY config.txt /home/builder/dumb-0.9.3/make
RUN make -C dumb-0.9.3 make-outdirs core allegro && \
	sudo make -C dumb-0.9.3 install-core install-allegro install-core-headers install-allegro-headers

WORKDIR /home/builder
RUN git clone https://github.com/amarillion/allegro4-gstream.git --depth 1 && \
	cd allegro4-gstream && \
	sh fixunix.sh && \
	sudo make install

VOLUME /data
WORKDIR /data

CMD /bin/bash
