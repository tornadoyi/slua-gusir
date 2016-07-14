rem luajit static lib in windows use TDM-GCC-64

cd .\luajit
mingw32-make clean

mingw32-make BUILDMODE=static CC="gcc -m64"
copy /Y src\libluajit.a ..\libluajit\x86_64\libluajit.a
copy /Y src\luajit.exe ..\libluajit\x86_64\luajit.exe
copy /Y src\jit\vmdef.lua ..\libluajit\x86_64\vmdef.lua

cd ..
