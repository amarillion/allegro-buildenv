FROM amarillion/alleg5-buildenv:latest

USER root
RUN apt-get update && apt-get -y install \
  libcurl3-dev \
  libcppunit-dev \
  inkscape \
  && rm -rf /var/lib/apt/lists/*

USER builder
CMD /bin/bash
