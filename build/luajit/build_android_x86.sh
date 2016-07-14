SHELL_PATH=$(cd "$(dirname "$0")"; pwd)
LUAJIT=../../LuaJIT-2.1.0-beta2
cd $LUAJIT 
#set ndk Path. Current use android-ndk-r10d For X86
NDK=$NDKPATH
NDKABI=9
NDKVER=$NDK/toolchains/x86-4.9
NDKP=$NDKVER/prebuilt/darwin-x86_64/bin/i686-linux-android-
NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-x86"
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_FLAGS="$NDKF" clean  
make HOST_CC="gcc -m32" CROSS=$NDKP TARGET_SYS=Linux TARGET_FLAGS="$NDKF" 

#cp -f src/libluajit.a ../libluajit/android/x86/libluajit.a
#cp -f src/luajit ../libluajit/android/x86/luajit
#cp -f src/jit/vmdef.lua ../libluajit/android/x86/vmdef.lua

