#!/bin/bash

export INSTALL_PREFIX=/usr/i686-w64-mingw32

cd /opt/source/minimp3
sudo mkdir -p $INSTALL_PREFIX/include
sudo cp minimp3*.h $INSTALL_PREFIX/include
# That's it... minimp3 is header-only