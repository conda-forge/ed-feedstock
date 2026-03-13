#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

tar --lzip --extract --verbose --file=ed-${PKG_VERSION}.tar.lz
cd ${SRC_DIR}/ed-${PKG_VERSION}

./configure --disable-silent-rules \
    --disable-dependency-tracking \
    --prefix=${PREFIX}
make CC=${CC}
if [[ ${build_platform} == ${target_platform} ]]; then
make check CC=${CC}
fi
make install CC=${CC}
