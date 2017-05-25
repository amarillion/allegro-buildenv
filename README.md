# Dockerized Allegro build environments

The aim of this project is to provide a collection of docker images as basis for setup and compilation of allegro projects.

Documentation about Docker: https://docs.docker.com/

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
