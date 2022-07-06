#!/bin/bash -e

wget https://ftp.osuosl.org/pub/xiph/releases/flac/flac-1.3.4.tar.xz -O- | tar xfJ -
cd flac*
./configure \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib"
make
sudo make install
cd ..
