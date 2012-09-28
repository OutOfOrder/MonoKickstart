Mono Kick Start
---------------

This is the simple "kickstart" code I wrote (derived from the stock generated code from Mono)
to more easily launch a Mono application on Linux.

Usage
-----

The usage is simple, rename the "kick.bin.x86" and "kick.bin.x86_64" after the name of your
primary executable.  e.g. for "MyGame.exe", you would name them MyGame.bin.*. On startup
the binary will automatically change the working directory to the binary directory, 
and locate and load the MyGame.exe and run it via the Mono libs. The executables are using
binreloc so they can be run through symlinks.  (e.g. ln -sf /usr/local/games/MyGame/MyGame.bin.x86
/usr/local/bin/MyGame)

Precompiled Libs
----------------

I've included precompiled libraries and some of the "core" Mono framework libs of Mono 2.10.8
that are build on a CentOS 6 system.  These are very portable libraries and will work on any
Linux distribution in the past 4 to 5 years (e.g. anything with Glibc 2.7 or newer).  These are
actually the very same binaries that were used in the Linux port of [Bastion by Supergiant Games](http://supergiantgames.com/?page_id=242).

The binaries are also setup with a runpath of \$ORIGIN/lib and \$ORIGIN/lib64 for 32bit and 64bit
respectively.  This along with binreloc allows the binaries to be run from "anywhere" and be able
to find the mono libs and working environment without needing any wrapper shell script.

License
-------

The code located in kick.c is licensed under the [zlib license](http://opensource.org/licenses/Zlib)
and can be used for open source and commercial products.  I would appreciate any patches to enhance
it's usefulness.

Binreloc is licensed under the [WTFPL](http://sam.zoy.org/wtfpl/).  Which simply (and cleanly) put
means you can do whatever you want with it.

Questions
---------

For any questions about the code feel free to contact me Edward Rudd.
