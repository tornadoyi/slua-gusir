CUR_PATH=$(cd "$(dirname "$0")"; pwd)

project="build_slua_osx.xcodeproj"
target="slua"
config="Release"

xcodebuild -project $project -target $target -configuration $config clean
xcodebuild -project $project -target $target -configuration $config build

cp -rf $CUR_PATH/build/Release/slua.bundle $CUR_PATH/../../../libs/slua/osx