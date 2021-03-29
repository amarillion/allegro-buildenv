#!/bin/bash -e

mkdir -p /home/builder/allegro5/Build/MingwRelease
cd /home/builder/allegro5/Build/MingwRelease
cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off \
	../..
make
sudo make install
sudo ldconfig