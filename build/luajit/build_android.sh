SHELL_PATH=$(cd "$(dirname "$0")"; pwd)
LUAJIT=$SHELL_PATH/../../LuaJIT-2.1.0-beta2
OUTPUT=$SHELL_PATH/../../libs/luajit/android/armeabi-v7a
cd $LUAJIT 
#set ndk Path. Current use android-ndk-r10d For X86
NDK=$ANDROID_NDK_HOME
NDKABI=14
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.9
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/arm-linux-androideabi-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"
NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH" clean   
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF $NDKARCH"

cp -f $LUAJIT/src/libluajit.a $OUTPUT/libluajit.a
cp -f $LUAJIT/src/libluajit.so $OUTPUT/libluajit.so
cp -f $LUAJIT/src/luajit $OUTPUT/luajit
#cp -f src/jit/vmdef.lua ../libluajit/android/x86/vmdef.lua

