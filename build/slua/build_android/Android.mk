LOCAL_PATH := $(call my-dir)

ROOT_PATH := $(LOCAL_PATH)/../../../
3RD_PATH := $(ROOT_PATH)/3rd
3RD_PBC_PATH := $(3RD_PATH)/pbc-master
INCLUDE_LUA_JIT_PATH := $(ROOT_PATH)/LuaJIT-2.1.0-beta2/src
INCLUDE_PBC_PATH := $(3RD_PBC_PATH)
EXTERN_PATH := $(ROOT_PATH)/libs/luajit/android

#display info
#$(warning $(ROOT_PATH)) 
#$(warning $(3RD_PATH))
#$(warning $(EXTERN_PATH))

#-----------------------------------------------------------
#set where to link luajit static module
include $(CLEAR_VARS)
LOCAL_MODULE := luajit
LOCAL_SRC_FILES := $(EXTERN_PATH)/$(TARGET_ARCH_ABI)/libluajit.a
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
	$(ROOT_PATH)/src/slua.c \
	$(3RD_PBC_PATH)/src/alloc.c \
	$(3RD_PBC_PATH)/src/array.c \
	$(3RD_PBC_PATH)/src/bootstrap.c \
	$(3RD_PBC_PATH)/src/context.c \
	$(3RD_PBC_PATH)/src/decode.c \
	$(3RD_PBC_PATH)/src/map.c \
	$(3RD_PBC_PATH)/src/pattern.c \
	$(3RD_PBC_PATH)/src/proto.c \
	$(3RD_PBC_PATH)/src/register.c \
	$(3RD_PBC_PATH)/src/rmessage.c \
	$(3RD_PBC_PATH)/src/stringpool.c \
	$(3RD_PBC_PATH)/src/varint.c \
	$(3RD_PBC_PATH)/src/wmessage.c \
	$(3RD_PBC_PATH)/binding/lua/pbc-lua.c \

LOCAL_C_INCLUDES :=\
	$(INCLUDE_LUA_JIT_PATH) \
	$(INCLUDE_PBC_PATH) \

#static link to luajit
LOCAL_WHOLE_STATIC_LIBRARIES += luajit 

include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)
