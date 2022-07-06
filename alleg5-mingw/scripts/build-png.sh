#!/bin/bash -e

# Adapted from openTTD cross-compilation instructions (updated version, changed '/usr/local' to '/usr'):
# https://wiki.openttd.org/en/Archive/Compilation and Ports/Cross-compiling for Windows
cd /opt/source/l*png*
./configure \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib"
make
sudo make install
