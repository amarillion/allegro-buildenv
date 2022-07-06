#!/bin/bash -e

# Adapted from openTTD cross-compilation instructions (just changed '/usr/local' to '/usr', and bumped version from 2.8 to 2.10):
# https://wiki.openttd.org/en/Archive/Compilation and Ports/Cross-compiling for Windows
cd /opt/source/freetype*
./configure \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    --enable-static \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib" \
    PKG_CONFIG_LIBDIR=/usr/i686-w64-mingw32/lib/pkgconfig
make
sudo make install
# Now freetype will be installed in /usr/i686-w64-mingw32 
