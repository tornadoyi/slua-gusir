#!/usr/bin/env bash
SHELL_PATH=$(cd "$(dirname "$0")"; pwd)
LUAJIT=$SHELL_PATH/../../LuaJIT-2.1.0-beta2
OUTPUT=$SHELL_PATH/../../libs/luajit/ios

cd $LUAJIT
LIPO="xcrun -sdk iphoneos lipo"
STRIP="xcrun -sdk iphoneos strip"

IXCODE=`xcode-select -print-path`
ISDK=$IXCODE/Platforms/iPhoneOS.platform/Developer
ISDKVER=iPhoneOS.sdk
ISDKP=$IXCODE/usr/bin/

if [ ! -e $ISDKP/ar ]; then
  sudo cp /usr/bin/ar $ISDKP
fi

if [ ! -e $ISDKP/ranlib ]; then
  sudo cp /usr/bin/ranlib $ISDKP
fi

if [ ! -e $ISDKP/strip ]; then
  sudo cp /usr/bin/strip $ISDKP
fi

make clean
ISDKF="-arch armv7 -isysroot $ISDK/SDKs/$ISDKVER"
make HOST_CC="gcc -m32 -std=c99" CROSS="$ISDKP" TARGET_FLAGS="$ISDKF" TARGET=armv7 TARGET_SYS=iOS LUAJIT_A=libluajitv7.a


make clean
ISDKF="-arch armv7s -isysroot $ISDK/SDKs/$ISDKVER"
make HOST_CC="gcc -m32 -std=c99" CROSS="$ISDKP" TARGET_FLAGS="$ISDKF" TARGET=armv7s TARGET_SYS=iOS LUAJIT_A=libluajitv7s.a

make clean
ISDKF="-arch arm64 -isysroot $ISDK/SDKs/$ISDKVER"
make HOST_CC="gcc -std=c99" CROSS="$ISDKP" TARGET_FLAGS="$ISDKF" TARGET=arm64 TARGET_SYS=iOS LUAJIT_A=libluajit64.a

cd src
lipo libluajitv7.a -create libluajitv7s.a libluajit64.a -output libluajit.a
cp libluajit.a $OUTPUT
cd ..
