CUR_PATH=$(cd "$(dirname "$0")"; pwd)

project="build_slua_ios.xcodeproj"
target="slua"
config="Release"

xcodebuild -project $project -target $target -configuration $config clean
xcodebuild -project $project -target $target -configuration $config build

cp $CUR_PATH/build/Release-iphoneos/libslua.a $CUR_PATH/../../../libs/slua/ios