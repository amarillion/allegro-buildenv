#!/bin/bash -e

cd /opt/source/physfs*

mkdir -p build/release
cd build/release

cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_TOOLCHAIN_FILE=/opt/source/Toolchain-mingw.cmake \
	-DCMAKE_INSTALL_PREFIX=/usr/i686-w64-mingw32 \
	../..

make
sudo make install
sudo ldconfig
