#!/bin/bash -e

# Check that we're in the right place
test -e src/allegro.c || (echo "Not correct allegro folder"; exit 1)

mkdir -p Build/Debug
cd Build/Debug
cmake -DCMAKE_BUILD_TYPE=Debug -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../..
make
sudo make install
sudo ldconfig
cd ../..