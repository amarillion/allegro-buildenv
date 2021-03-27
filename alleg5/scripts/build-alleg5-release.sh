#!/bin/bash -e

mkdir -p /home/builder/allegro5/Build/Release
cd /home/builder/allegro5/Build/Release
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../..
make
sudo make install
sudo ldconfig