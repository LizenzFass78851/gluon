#!/bin/sh

set -e

export BROKEN=1
export GLUON_AUTOREMOVE=1
export GLUON_DEPRECATED=1
export GLUON_SITEDIR="site-ffc"
export GLUON_TARGET="$1"
export BUILD_LOG=1
export DEFAULT_GLUON_RELEASE="b$(date '+%Y%m%d')"

BUILD_THREADS="$(($(nproc) + 1))"

echo "Building Gluon with $BUILD_THREADS threads"

make update
make -j$BUILD_THREADS V=s
