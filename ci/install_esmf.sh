#!/usr/bin/env bash
set -e
set -x

cd ${HOME}

git clone https://git.code.sf.net/p/esmf/esmf deps/esmf
cd deps/esmf
export ESMF_DIR=$PWD
export ESMF_INSTALL_PREFIX=/usr/esmf
export ESMFMKFILE=${ESMF_INSTALL_PREFIX}/esmf.mk
gmake -j8 lib
gmake install

cd ${TRAVIS_BUILD_DIR}