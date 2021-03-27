#!/bin/bash -e

mkdir -p /home/builder/allegro5/Build/Static
cd /home/builder/allegro5/Build/Static
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_STATIC_RUNTIME=on -DSHARED=off -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../..
make
sudo make install
sudo ldconfig