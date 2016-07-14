rem compile slua for windows use TDM-GCC-64

gcc ..\..\slua.c ^
	..\pbc-win\src\alloc.c ^
	..\pbc-win\src\array.c ^
	..\pbc-win\src\bootstrap.c ^
	..\pbc-win\src\context.c ^
	..\pbc-win\src\decode.c ^
	..\pbc-win\src\map.c ^
	..\pbc-win\src\pattern.c ^
	..\pbc-win\src\proto.c ^
	..\pbc-win\src\register.c ^
	..\pbc-win\src\rmessage.c ^
	..\pbc-win\src\stringpool.c ^
	..\pbc-win\src\varint.c ^
	..\pbc-win\src\wmessage.c ^
	..\pbc-win\binding\lua\pbc-lua.c ^
	-I..\pbc-win ^
	-o x86_64/slua.dll -m64 -shared -I..\..\luajit/src -Wl,--whole-archive ..\..\libluajit/x86_64/libluajit.a -Wl,--no-whole-archive
	
gcc ..\..\slua.c ^
	..\pbc-win\src\alloc.c ^
	..\pbc-win\src\array.c ^
	..\pbc-win\src\bootstrap.c ^
	..\pbc-win\src\context.c ^
	..\pbc-win\src\decode.c ^
	..\pbc-win\src\map.c ^
	..\pbc-win\src\pattern.c ^
	..\pbc-win\src\proto.c ^
	..\pbc-win\src\register.c ^
	..\pbc-win\src\rmessage.c ^
	..\pbc-win\src\stringpool.c ^
	..\pbc-win\src\varint.c ^
	..\pbc-win\src\wmessage.c ^
	..\pbc-win\binding\lua\pbc-lua.c ^
	-I..\pbc-win ^
	-o x86/slua.dll -m32 -shared -I..\..\luajit/src -Wl,--whole-archive ..\..\libluajit/x86/libluajit.a -Wl,--no-whole-archive
