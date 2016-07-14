# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

MY_SRC_PATH := $(LOCAL_PATH)/../../
MY_3RD_PATH := $(LOCAL_PATH)/..
MY_INCLUDE_PATH := $(LOCAL_PATH)/../../luajit/src
MY_EXTERN_PATH := $(LOCAL_PATH)/../../libluajit/android

#display info
#$(warning $(MY_SRC_PATH)) 
#$(warning $(MY_INCLUDE_PATH))
#$(warning $(MY_EXTERN_PATH))

#-----------------------------------------------------------
#set where to link luajit static module
include $(CLEAR_VARS)
LOCAL_MODULE := luajit
LOCAL_SRC_FILES := $(MY_EXTERN_PATH)/$(TARGET_ARCH_ABI)/libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

#-----------------------------------------------------------
#set sLua model 
include $(CLEAR_VARS)

#model name
LOCAL_MODULE := slua

#ouput to ../bin dir

#use exception
LOCAL_CPP_FEATURES := exceptions

LOCAL_SRC_FILES :=\
	$(MY_SRC_PATH)/slua.c \
	$(MY_3RD_PATH)/pbc-master/src/alloc.c \
	$(MY_3RD_PATH)/pbc-master/src/array.c \
	$(MY_3RD_PATH)/pbc-master/src/bootstrap.c \
	$(MY_3RD_PATH)/pbc-master/src/context.c \
	$(MY_3RD_PATH)/pbc-master/src/decode.c \
	$(MY_3RD_PATH)/pbc-master/src/map.c \
	$(MY_3RD_PATH)/pbc-master/src/pattern.c \
	$(MY_3RD_PATH)/pbc-master/src/proto.c \
	$(MY_3RD_PATH)/pbc-master/src/register.c \
	$(MY_3RD_PATH)/pbc-master/src/rmessage.c \
	$(MY_3RD_PATH)/pbc-master/src/stringpool.c \
	$(MY_3RD_PATH)/pbc-master/src/varint.c \
	$(MY_3RD_PATH)/pbc-master/src/wmessage.c \
	$(MY_3RD_PATH)/pbc-master/binding/lua/pbc-lua.c \

LOCAL_C_INCLUDES :=\
	$(MY_INCLUDE_PATH) \
	$(MY_3RD_PATH)/pbc-master \

#static link to luajit
LOCAL_WHOLE_STATIC_LIBRARIES += luajit 

include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)
