#!/bin/bash -e

git clone https://github.com/kode54/dumb.git --depth 1

# Alternative for specific version:
# wget https://github.com/kode54/dumb/archive/refs/tags/2.0.3.tar.gz -O- | tar xfz -

cd dumb*
mkdir -p build/release
cd build/release
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_TOOLCHAIN_FILE=/home/builder/Toolchain-mingw.cmake \
	-DCMAKE_INSTALL_PREFIX=/usr/i686-w64-mingw32 \
	-DBUILD_SHARED_LIBS:BOOL=OFF \
	-DBUILD_EXAMPLES:BOOL=OFF \
	-DBUILD_ALLEGRO4:BOOL=OFF \
	../..
make
sudo make install
sudo ldconfig
