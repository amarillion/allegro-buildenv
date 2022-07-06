#!/bin/bash -e

cd /opt/source/libtheora*
./configure \
    --host=i686-w64-mingw32 \
    --prefix=/usr/i686-w64-mingw32 \
    CPPFLAGS="-I/usr/i686-w64-mingw32/include" \
    LDFLAGS="-L/usr/i686-w64-mingw32/lib"
make
sudo make install
cd ..

# TODO: ERRORS out with
# echo EXPORTS > .libs/libtheoradec-1.dll.def; cat .libs/libtheoradec.def >> .libs/libtheoradec-1.dll.def; fi
# libtool: link:  i686-w64-mingw32-gcc -shared .libs/libtheoradec-1.dll.def  .libs/apiwrapper.o .libs/bitpack.o .libs/decapiwrapper.o .libs/decinfo.o .libs/decode.o .libs/dequant.o .libs/fragment.o .libs/huffdec.o .libs/idct.o .libs/info.o .libs/internal.o .libs/quant.o .libs/state.o .libs/mmxidct.o .libs/mmxfrag.o .libs/mmxstate.o .libs/x86state.o   -L/usr/i686-w64-mingw32/lib    -o .libs/libtheoradec-1.dll -Wl,--enable-auto-image-base -Xlinker --out-implib -Xlinker .libs/libtheoradec.dll.a
# /usr/bin/i686-w64-mingw32-ld: .libs/libtheoradec-1.dll.def:3: syntax error
# /usr/bin/i686-w64-mingw32-ld:.libs/libtheoradec-1.dll.def: file format not recognized; treating as linker script
# /usr/bin/i686-w64-mingw32-ld:.libs/libtheoradec-1.dll.def:2: syntax error
# collect2: error: ld returned 1 exit status
# make[2]: *** [Makefile:468: libtheoradec.la] Error 1
# make[2]: Leaving directory '/home/builder/libtheora-1.1.1/lib'
# make[1]: *** [Makefile:291: all-recursive] Error 1
# make[1]: Leaving directory '/home/builder/libtheora-1.1.1'
# make: *** [Makefile:205: all] Error 2
# The command '/bin/sh -c ./build-theora.sh' returned a non-zero code: 2