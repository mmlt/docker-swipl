# Swipl compiler image.
# Contains all that's needed to compile Swipl sources and produce a tgz for distribution.
FROM debian:jessie
MAINTAINER PieterE

# install prerequisites
# first apt-get is to statisfy core dependencies.
# second apt-get gets xpce dependencies.
RUN apt-get update \
  && apt-get dist-upgrade -yq \
  && apt-get install -yqq build-essential curl libarchive13 libarchive-dev libgmp-dev libossp-uuid-dev libreadline-dev libssl-dev zlib1g-dev \
  && apt-get install -yqq libxft-dev libxinerama-dev libxpm-dev libjpeg-dev libxt-dev libxext-dev \
  && apt-get clean

COPY build /


