#!/bin/bash -e

wget https://downloads.xiph.org/releases/ogg/libogg-1.3.4.tar.gz -O- | tar xfz -
cd libogg*
./configure \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib"
make
sudo make install
cd ..
