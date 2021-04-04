#!/bin/bash -e

# Check that we're in the right place
test -e src/allegro.c || (echo "Not correct allegro folder"; exit 1)

mkdir -p Build/MingwStatic
cd Build/MingwStatic

# Added CMAKE_SHARED_LINKER_FLAGS to prevent multiple definition error, see discussion here;
# https://www.allegro.cc/forums/thread/618386/1049706#target
cmake \
	-DCMAKE_TOOLCHAIN_FILE=../../cmake/Toolchain-mingw.cmake \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DWANT_STATIC_RUNTIME=on \
	-DFREETYPE_PNG=on \
	-DFREETYPE_ZLIB=on \
	-DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off \
	-DCMAKE_SHARED_LINKER_FLAGS=-Wl,-allow-multiple-definition \
	../..
make
sudo make install
sudo ldconfig
cd ../..