#!/bin/bash -e

mkdir -p /home/builder/allegro5/Build/MingwStatic
cd /home/builder/allegro5/Build/MingwStatic
cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DWANT_STATIC_RUNTIME=on \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DCMAKE_BUILD_TYPE=Debug \
	-DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off \
	../..
make
sudo make install
sudo ldconfig