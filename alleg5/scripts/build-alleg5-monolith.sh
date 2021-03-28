#!/bin/bash -e

# Check that we're in the right place
test -e src/allegro.c || (echo "Not correct allegro folder"; exit 1)

mkdir -p Build/Monolith
cd Build/Monolith
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_MONOLITH=on -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../..
make
sudo make install
sudo ldconfig
cd ../..