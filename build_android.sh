#!/bin/bash

NDK=/home/jqian/env/android-ndk-r9c

SYSROOT=$NDK/platforms/android-9/arch-arm/

TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86_64

function build_one
{
./configure \
	--prefix=$PREFIX \
	--disable-doc \
	--disable-ffserver \
	--disable-yasm \
	--enable-cross-compile \
	--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
	--target-os=linux \
	--arch=arm \
	--sysroot=$SYSROOT \
	--extra-cflags="-Os -fpic -DANDROID -marm $ADDI_CFLAGS -I./faac-1.28/include/ -I./x264/" \
	--extra-ldflags="$ADDI_LDFLAGS -llog -L./faac-1.28/libfaac/.libs/ -L./x264" \
	$ADDITIONAL_CONFIGURE_FLAG \
	--enable-nonfree \
	--enable-libfaac \
	--enable-gpl \
	--enable-libx264 \
	--enable-encoder=libx264 \
	--disable-devices \
	--disable-avdevice \
	

#	--enable-shared \
#	--disable-static \

}

CPU=arm

PREFIX=$(pwd)/android/$CPU

ADDI_CFLAGS="-marm"

build_one