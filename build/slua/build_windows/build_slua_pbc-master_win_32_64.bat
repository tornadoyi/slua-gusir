set CUR_PATH=%cd%
set SEHLL_PATH=%~dp0
set ROOT_PATH=%SEHLL_PATH%..\..\..
set LUAJIT_PATH=%ROOT_PATH%\LuaJIT-2.1.0-beta2
set SLUA_PATH=%ROOT_PATH%\src
set PBC_PATH=%ROOT_PATH%\3rd\pbc-win
set LIBS_PATH=%ROOT_PATH%\libs
set OUTPUT_PATH=%LIBS_PATH%\slua

set SRC=%SLUA_PATH%\slua.c ^
	%PBC_PATH%\src\alloc.c ^
	%PBC_PATH%\src\array.c ^
	%PBC_PATH%\src\bootstrap.c ^
	%PBC_PATH%\src\context.c ^
	%PBC_PATH%\src\decode.c ^
	%PBC_PATH%\src\map.c ^
	%PBC_PATH%\src\pattern.c ^
	%PBC_PATH%\src\proto.c ^
	%PBC_PATH%\src\register.c ^
	%PBC_PATH%\src\rmessage.c ^
	%PBC_PATH%\src\stringpool.c ^
	%PBC_PATH%\src\varint.c ^
	%PBC_PATH%\src\wmessage.c ^
	%PBC_PATH%\binding\lua\pbc-lua.c ^
	
set INCLUDE=-I%LUAJIT_PATH%\src ^
	-I%PBC_PATH% ^
	
set LIBS_X64=-Wl,--whole-archive %LIBS_PATH%\luajit\x86_64\libluajit.a ^
	-Wl,--no-whole-archive
	
set LIBS_X86=-Wl,--whole-archive %LIBS_PATH%\luajit\x86\libluajit.a ^
	-Wl,--no-whole-archive	
	
gcc %SRC% %INCLUDE% -o %OUTPUT_PATH%\x86_64\slua.dll -m64 -shared %LIBS_X64%
gcc %SRC% %INCLUDE% -o %OUTPUT_PATH%\x86\slua.dll -m32 -shared %LIBS_X86%