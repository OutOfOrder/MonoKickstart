#!/bin/sh

if [ -z "$STAGE" ]; then
    echo "Set the STAGE environment variable to the directory to install the mono build to"
    exit 1
fi

plat=`uname -s`
if [ "$plat" = "Darwin" ]; then
    if [ -z "$1" ]; then
        echo "Pass either 32 or 64 to specify the architecture of the build for OS X"
        exit 1
    fi
    arch="$1"
    shift 1

    if [ "$arch" = "32" ]; then
        EXTRA_FLAGS="--build=i686-apple-darwin10"
    else
        EXTRA_FLAGS="--build=x86_64-apple-darwin10"
    fi
    export CFLAGS="-mmacosx-version-min=10.6"
    export CXXFLAGS=${CFLAGS}
    export LDFLAGS=${CFLAGS}
    EXTRA_FLAGS="${EXTRA_FLAGS} --without-x"
fi

if [ ! -x ./configure ]; then
    echo "Could not find configure"
    exit 2
fi

./configure --prefix="$STAGE" \
           --with-ikvm-native=yes --with-jit=yes \
           --with-moonlight=no --with-monotouch=no \
           --enable-minimal=debug,portability,profiler \
           --disable-mono-debugger \
           --with-sgen=yes \
           --with-jit=yes \
           --with-mcs-docs=no \
           --with-profile2=no \
           --with-profile4=yes \
           ${EXTRA_FLAGS}  \
           "$@"
exit
make -j6
make install
