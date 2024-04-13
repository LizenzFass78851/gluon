#!/bin/sh

set -e

export BROKEN=1
export GLUON_AUTOREMOVE=1
export GLUON_DEPRECATED=1
export GLUON_SITEDIR="site"
export GLUON_TARGET="$1"
export BUILD_LOG=1

make update
make -j$(nproc||printf "2") V=s
