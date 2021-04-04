#!/bin/bash -e

# General instructions here: https://wiki.openssl.org/index.php/Compilation_and_Installation
# Adapted from complete instructions here: https://github.com/curl/curl/issues/1492

wget https://www.openssl.org/source/openssl-1.0.2k.tar.gz -O- | tar xfz -
cd openssl-1.0.2k/

# Alternative to setting CC: define CROSS_COMPILE, which prefixes each build tool:
CROSS_COMPILE="i686-w64-mingw32-" \
	./Configure mingw64 \
		no-asm \
		shared \
		--prefix=/usr/i686-w64-mingw32/ \
		--openssldir=/usr/i686-w64-mingw32
make depend
make
sudo make install
cd ..
