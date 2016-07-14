CUR_PATH=$(cd "$(dirname "$0")"; pwd)
ndk-build NDK_PROJECT_PATH=$CUR_PATH APP_BUILD_SCRIPT=$CUR_PATH/Android.mk NDK_APPLICATION_MK=$CUR_PATH/Application.mk clean
