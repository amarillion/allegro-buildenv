FROM amarillion/alleg5-buildenv:latest-mingw-w64-i686

USER root
RUN apt-get update && apt-get -y install \
  inkscape \
  wget \
# xutils-dev contains makedepend, which openssl needs to compile...
  xutils-dev \
  && rm -rf /var/lib/apt/lists/*

USER builder

COPY scripts /opt/source/

RUN cd /opt/source && \
  ./build-cppunit.sh && \
  ./build-openssl.sh && \
  ./build-curl.sh

WORKDIR /data
CMD /bin/bash
