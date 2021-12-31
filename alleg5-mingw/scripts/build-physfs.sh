#!/bin/bash -e

wget https://github.com/icculus/physfs/archive/refs/tags/release-3.0.2.tar.gz -O- | tar xfz -
pushd physfs*

mkdir -p build/release
pushd build/release

cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_TOOLCHAIN_FILE=/opt/source/Toolchain-mingw.cmake \
	-DCMAKE_INSTALL_PREFIX=/usr/i686-w64-mingw32 \
	../..

make
sudo make install
sudo ldconfig
popd
popd
