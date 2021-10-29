# Dockerized Allegro build environments

The aim of this project is to provide a collection of docker images as basis for setup and compilation of allegro projects.

Docker documentation: https://docs.docker.com/

## Set up Docker

	# Install the software on a debian-like system:
	sudo apt install docker.io

	# If you add the current user to the docker group,
	# then you can invoke docker without superuser rights.
	# This takes effect after re-login.
	sudo usermod -aG docker $USER

## Using the docker images

In the following example, the docker image `amarillion/alleg5-buildenv` is pulled
from dockerhub. The current directory is mapped to data within the docker image.
Then the command make is run in the current directory. The -u line ensures that build files have the correct owner.

	docker run \
		-v `pwd`:/data
		-u `stat -c "%u:%g" .`
		amarillion/alleg5-buildenv \
		make

For a list of publicly available images, see:
https://hub.docker.com/u/amarillion/

## Overview of images

So far I've prepared the following images:

amarillion/alleg5-buildenv
* 5.2.7.0-linux latest-linux: For linux: allegro 5, release, monolith, debug and static builds
* 5.2.7.0-mingw-64-i686, latest-mingw-64-i686: Cross-build environment for windows (32 bit).

amarillion/alleg5-plus-buildenv
* same as above, but also includes libcurl-dev, cppunit, and inkscape (for automated conversion of svg images)
* 5.2.7.0-linux latest-linux
* 5.2.7.0-mingw-64-i686, latest-mingw-64-i686

amarillion/alleg5-dallegro
* only linux variant available at the moment.
* Based on amarillion/alleg5-buildenv
* Includes dmd compiler and SiegeLord's D extension

amarillion/alleg4-buildenv
* allegro 4, release and debug builds

amarillion/alleg4-plus-buildenv
* same as above, but with alfont, dumb and masking add-ons

amarillion/android
* still WIP - the intention is to prepare all the dependencies needed for compiling allegro for android

## Example

Here is a working example:
https://github.com/amarillion/allegro-buildenv-example

## See also

Discussion threads on allegro.cc: 
* https://www.allegro.cc/forums/thread/616906
* https://www.allegro.cc/forums/thread/617543
* https://www.allegro.cc/forums/thread/618390