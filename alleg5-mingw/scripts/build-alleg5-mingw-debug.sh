#!/bin/bash -e

mkdir -p /home/builder/allegro5/Build/MingwDebug
cd /home/builder/allegro5/Build/MingwDebug
cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DCMAKE_BUILD_TYPE=Debug \
	-DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off \
	../..
make
sudo make install
sudo ldconfig
