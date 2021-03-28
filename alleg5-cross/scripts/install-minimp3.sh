#!/bin/bash

export INSTALL_PREFIX=/usr/i686-w64-mingw32

git clone https://github.com/lieff/minimp3.git --depth 1
sudo mkdir -p $INSTALL_PREFIX/include
sudo cp minimp3/minimp3*.h $INSTALL_PREFIX/include
# That's it... minimp3 is header-only