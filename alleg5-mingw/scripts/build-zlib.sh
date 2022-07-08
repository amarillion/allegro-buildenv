#!/bin/bash -e

# Adapted from openTTD cross-compilation instructions (changed '/usr/local' to '/usr'):
# https://wiki.openttd.org/en/Archive/Compilation and Ports/Cross-compiling for Windows
cd /opt/source/zlib*
# zlib 'configure' script is currently broken, use win32/Makefile.gcc directly
sed -e s/"PREFIX ="/"PREFIX = i686-w64-mingw32-"/ -i win32/Makefile.gcc # automatic replacement
make -f win32/Makefile.gcc
sudo BINARY_PATH=/usr/i686-w64-mingw32/bin \
    INCLUDE_PATH=/usr/i686-w64-mingw32/include \
    LIBRARY_PATH=/usr/i686-w64-mingw32/lib \
    make -f win32/Makefile.gcc install
# TODO: clean

