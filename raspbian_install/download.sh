#!/bin/bash
source env.sh

if [ ! -d downloads ]; then mkdir downloads; fi
cd downloads

# Download raspbian image in a zip file and etcher cli tarball
wget -c -O $RASPBIAN_VERSION.zip https://downloads.raspberrypi.org/$RASPBIAN_VERSION
wget -c https://github.com/balena-io/etcher/releases/download/v$ETCHER_VERSION/balena-etcher-cli-$ETCHER_VERSION-linux-x64.tar.gz

# Extract all zip/tar files
tar -xf *.tar.gz
unzip -n *.zip

cd ..
