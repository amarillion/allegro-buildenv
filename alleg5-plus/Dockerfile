FROM amarillion/alleg5-buildenv:latest

USER root
RUN apt-get update && apt-get -y install \
  libcurl3-dev \
  libcppunit-dev

USER builder
CMD /bin/bash
