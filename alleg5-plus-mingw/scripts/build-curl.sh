#!/bin/bash -e


# Adapted from complete instructions here: https://github.com/curl/curl/issues/1492

wget https://curl.haxx.se/download/curl-7.84.0.tar.gz -O- | tar xfz -
cd curl*
./configure \
    --disable-shared \
    --disable-ldap \
    --without-ca-bundle \
    --without-ca-path \
    --without-libidn2 \
    --without-libpsl \
    --without-librtmp \
    --without-libssh2 \
    --without-nghttp2 \
    --with-ssl \
    --with-zlib \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib"


make
sudo make install

# Remove intermediate files
make clean

cd ..
