# set luajit path
LUAJIT=./luajit

# get xode path
IXCODE=`xcode-select -print-path`
DEVDIR=$IXCODE/Platforms

# get ios sdk path
IOSDIR=$DEVDIR/iPhoneOS.platform/Developer  
SIMDIR=$DEVDIR/iPhoneSimulator.platform/Developer

# get ios sdk version
INFOPLIST_PATH=$IXCODE/Platforms/iPhoneOS.platform/version.plist
BUNDLE_ID=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "${INFOPLIST_PATH}")

IOSVER=iPhoneOS${BUNDLE_ID}.sdk
SIMVER=iPhoneSimulator.sdk

# get tootchain
#IOSBIN=$IOSVER/usr/bin/
#SIMBIN=$SIMDIR/usr/bin/
ICC=$(xcrun --sdk iphoneos --find clang)
IOSBIN=$(dirname $ICC)/
SIMBIN=$(dirname $ICC)/

BUILD_DIR=$LUAJIT/build  
  
rm -rf $BUILD_DIR  
mkdir -p $BUILD_DIR  
rm *.a 1>/dev/null 2>/dev/null  
  
echo =================================================  
echo ARMV7 Architecture  
ISDKF="-arch armv7 -isysroot $IOSDIR/SDKs/$IOSVER"  
make -j -C $LUAJIT HOST_CC="gcc -m32 " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=armv7 TARGET_SYS=iOS clean  
make -j -C $LUAJIT HOST_CC="gcc -m32 " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=armv7 TARGET_SYS=iOS   
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitA7.a  
  
echo =================================================  
echo ARM64 Architecture  
ISDKF="-arch arm64 -isysroot $IOSDIR/SDKs/$IOSVER"  
make -j -C $LUAJIT HOST_CC="gcc " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=arm64 TARGET_SYS=iOS clean  
make -j -C $LUAJIT HOST_CC="gcc " CROSS=$IOSBIN TARGET_FLAGS="$ISDKF" TARGET=arm64 TARGET_SYS=iOS   
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajit64bit.a  
  
echo =================================================  
echo IOS Simulator Architecture  
ISDKF="-arch x86_64 -isysroot $SIMDIR/SDKs/$SIMVER -miphoneos-version-min=7.0"  
make -j -C $LUAJIT HOST_CFLAGS="-arch x86_64" HOST_LDFLAGS="-arch x86_64" TARGET_SYS=iOS TARGET=x86_64 clean  
make -j -C $LUAJIT HOST_CFLAGS="-arch x86_64" HOST_LDFLAGS="-arch x86_64" TARGET_SYS=iOS TARGET=x86_64 amalg CROSS=$SIMBIN TARGET_FLAGS="$ISDKF"  
  
  
mv $LUAJIT/src/libluajit.a $BUILD_DIR/libluajitx86_64.a  
  
libtool -o $BUILD_DIR/libluajit-2.1-x86-armv7-arm64.a $BUILD_DIR/*.a 2> /dev/null  
  
mv -f $BUILD_DIR/libluajit-2.1-x86-armv7-arm64.a ./libluajit/ios
cp -f ./libluajit/ios/libluajit-2.1-x86-armv7-arm64.a ./Plugins/iOS/libluajit-2.1-x86-armv7-arm64.a 
