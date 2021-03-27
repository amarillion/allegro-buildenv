#!/bin/bash -e

mkdir -p /home/builder/allegro5/Build/Debug
cd /home/builder/allegro5/Build/Debug
cmake -DCMAKE_BUILD_TYPE=Debug -DWANT_DEMO=off -DWANT_EXAMPLES=off -DWANT_DOCS=off ../..
make
sudo make install
sudo ldconfig