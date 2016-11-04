.PHONY: all swipl-compiler swipl-binary swipl-image login push clean

# swipl version to build
version=7.3.19
# registry to push to (gcr.io/, quay.io/, empty for index.docker.io)
registry=
# repository within registry
repo=pietere

cwd=$(shell pwd)

# Create a Docker image with swipl
all: swipl-compiler swipl-binary swipl-image

# Create an image with compiler and tools.
swipl-compiler:
	docker pull debian:jessie
	docker build -t swipl-compiler compiler

# Download and compile a swipl tar.gz into a distribute/binary.
# Add env var's to Docker run to customize the build, for example add -e DISABLE_PKGS="jpl xpce" to trim down the binary
# or  -e EXTRA_PKGS="db space" to include more packages. See build.templ in source tree for details.
# To run swipl-compiler interactive: docker run -ti --rm -v $(pwd)/distribute:/distribute swipl-compiler bash
swipl-binary:
	docker run --rm -v $(cwd)/distribute:/distribute swipl-compiler /build http://www.swi-prolog.org/download/devel/src/swipl-$(version).tar.gz

# Build an image with the distribute/binary installed
swipl-image: 
	docker build -t $(registry)$(repo)/swipl distribute

# Registry login
login:
	docker login $(registry)
	
# Push changes to registry
push:
	docker push $(registry)$(repo)/swipl:latest
	docker tag $(registry)$(repo)/swip $(registry)$(repo)/swipl:$(version)
	docker push $(registry)$(repo)/swipl:$(version)


clean:
	docker rmi swipl-compiler
	-rm $(cwd)/distribute/*tgz
