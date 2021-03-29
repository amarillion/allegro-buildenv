#!/bin/bash

git clone https://github.com/lieff/minimp3.git --depth 1
sudo mkdir -p /usr/local/include
sudo cp minimp3/minimp3*.h /usr/local/include
# That's it... minimp3 is header-only