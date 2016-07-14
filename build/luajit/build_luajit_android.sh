LUAJIT=./luajit
cd $LUAJIT 
#set ndk Path. Current use android-ndk-r10d For ArmV7
NDK=$ANDROID_NDK
NDKABI=9  
NDKVER=$NDK/toolchains/arm-linux-androideabi-4.9  
NDKP=$NDKVER/prebuilt/linux-x86/bin/arm-linux-androideabi-  
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"  
NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_FLAGS="$NDKF $NDKARCH" clean
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_FLAGS="$NDKF $NDKARCH"
cp -f src/libluajit.a ../libluajit/android/armeabi-v7a/libluajit.a
cp -f src/luajit ../libluajit/android/armeabi-v7a/luajit
cp -f src/jit/vmdef.lua ../libluajit/android/armeabi-v7a/vmdef.lua
