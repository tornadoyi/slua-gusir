rem luajit static lib in windows use TDM-GCC-64
set CUR_PATH=%cd%
set SEHLL_PATH=%~dp0
set ROOT_PATH=%SEHLL_PATH%..\..
set LUAJIT_PATH=%ROOT_PATH%\LuaJIT-2.1.0-beta2
SET OUTPUT_PATH=%ROOT_PATH%\libs\luajit\x86
cd %LUAJIT_PATH%
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m32"
copy /Y %LUAJIT_PATH%\src\libluajit.a %OUTPUT_PATH%\libluajit.a
copy /Y %LUAJIT_PATH%\src\luajit.exe %OUTPUT_PATH%\luajit.exe

cd %CUR_PATH%