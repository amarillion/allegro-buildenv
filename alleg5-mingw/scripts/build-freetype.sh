#!/bin/bash -e

# Adapted from openTTD cross-compilation instructions (just changed '/usr/local' to '/usr', and bumped version from 2.8 to 2.10):
# https://wiki.openttd.org/en/Archive/Compilation and Ports/Cross-compiling for Windows
wget http://downloads.sourceforge.net/project/freetype/freetype2/2.12.1/freetype-2.12.1.tar.gz -O- | tar xfz -
cd freetype*
./configure \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    --enable-static \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib" \
    PKG_CONFIG_LIBDIR=/usr/i686-w64-mingw32/lib/pkgconfig
make
sudo make install
cd ..
# Now freetype will be installed in /usr/i686-w64-mingw32/ 
