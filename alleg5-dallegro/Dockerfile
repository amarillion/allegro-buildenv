FROM amarillion/alleg5-buildenv:latest

USER root

RUN apt-get update && apt-get -y install \
	wget \
	&& rm -rf /var/lib/apt/lists/*

USER builder
WORKDIR /home/builder

# Download deb directly from here: https://dlang.org/download.html
RUN wget https://s3.us-west-2.amazonaws.com/downloads.dlang.org/releases/2021/dmd_2.096.0-0_amd64.deb && \
	sudo dpkg -i dmd_2.096.0-0_amd64.deb && \
	git clone https://github.com/SiegeLord/DAllegro5.git --depth 1 &&\
	cd /home/builder/DAllegro5 && \
	./build_lib_dmd.sh

WORKDIR /data
CMD /bin/bash
