-Wl,--verbose   -->   See the linker logs

-idirafter /usr/include    -->  Use these paths after default paths

-I/usr/include ---> Use these paths before default paths

--dynamic-linker=${SYSROOT}/lib64/ld-2.26.so -Wl,-rpath=${SYSROOT}/lib64    --> Set default loader and library path

--sysroot=${SYSROOT}  --> Set system root where GCC searches for default paths

LIBRARY_PATH    --->  Set paths for libraries . Will be searched after default paths

-L/usr/lib --> Set paths for libraries . Will be searched before default paths

gcc  -E -Wp,-v   --> See preprocessor logs
