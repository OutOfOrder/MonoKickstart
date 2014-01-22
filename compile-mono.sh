#!/bin/sh

if [ -z "$STAGE" ]; then
    echo "Set the STAGE environment variable to the directory to install the mono build to"
    exit 1
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
           --with-profile4=yes

make -j6
make install
