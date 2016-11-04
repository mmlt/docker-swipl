# Swipl distribution image.
# Contains swipl runtime environment.
FROM debian:jessie
MAINTAINER PieterE

# install prerequisites
# first apt-get is to statisfy core dependencies.
# second apt-get gets xpce dependencies.
RUN apt-get update \
  && apt-get dist-upgrade -yq \
  && apt-get install -yq libarchive13 libgmp10 libossp-uuid16 libssl1.0.0 \
  && apt-get install -yqq libxft2 libxinerama1 libxpm4 libjpeg62-turbo libxt6 libxext6 \
  && apt-get clean

# install swipl
ADD swipl-binary.tgz .
RUN ln -s /swipl/bin/swipl /usr/bin/swipl
CMD swipl