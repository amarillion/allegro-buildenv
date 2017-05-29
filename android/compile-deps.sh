#!/bin/bash -e
# ARCH is one of armeabi-v7a, armeabi, x86, x86_64, arm64-v8a, mips, mips64

export ANDROID_NDK_TOOLCHAIN_ROOT=$HOME/toolchain-$ARCH
export PKG_CONFIG_LIBDIR=$ANDROID_NDK_TOOLCHAIN_ROOT/lib
export PATH=$ANDROID_NDK_TOOLCHAIN_ROOT/bin:${PATH}

python android-ndk-r12b/build/tools/make_standalone_toolchain.py --arch arm --api 15 --install-dir $ANDROID_NDK_TOOLCHAIN_ROOT 

cd $ANDROID_NDK_TOOLCHAIN_ROOT
tar -xjf ~/freetype-2.7.tar.bz2
cd freetype-2.7
./configure --host=arm-linux-androideabi --prefix=$ANDROID_NDK_TOOLCHAIN_ROOT --without-png --without-harfbuzz 
make
make install

cd $ANDROID_NDK_TOOLCHAIN_ROOT
tar -xJf ~/libogg-1.3.2.tar.xz
cd libogg-1.3.2
./configure --host=arm-linux-androideabi --prefix=$ANDROID_NDK_TOOLCHAIN_ROOT
make
make install

cd $ANDROID_NDK_TOOLCHAIN_ROOT
tar -xJf ~/libvorbis-1.3.5.tar.xz
cd libvorbis-1.3.5
./configure --host=arm-linux-androideabi --prefix=$ANDROID_NDK_TOOLCHAIN_ROOT
make
make install

