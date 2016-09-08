#!/bin/bash

set -euxo pipefail

rm -r ./sysbench ||true
apt-get -y install automake
apt-get -y install libtool
git clone https://github.com/akopytov/sysbench.git
./sysbench/autogen.sh
./sysbench/configure.sh --without-mysql
make
