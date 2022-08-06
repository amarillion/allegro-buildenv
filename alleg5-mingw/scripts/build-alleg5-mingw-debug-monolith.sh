#!/bin/bash -e

# Check that we're in the right place
test -e src/allegro.c || (echo "Not correct allegro folder"; exit 1)

mkdir -p Build/MingwMonolithDebug
cd Build/MingwMonolithDebug
cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DCMAKE_BUILD_TYPE=Debug \
	-DWANT_MONOLITH=on \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off \
	../..
make
sudo make install
sudo ldconfig
cd ../..