export SYSROOT=/home/ashwin/share/install/sysroot

CFLAGS="-march=armv8-a" ../source/binutils-2.29.1/configure --with-pkgversion='GCC Build' --with-sysroot=$SYSROOT --prefix=$SYSROOT/usr
make
make install
-------------------------------------------------------------------------------------------
# LInux HEADER
make headers_install ARCH=arm64 INSTALL_HDR_PATH=$SYSROOT/usr HOSTCC=/usr/bin/gcc -C ../source/linux_source_dir/
-------------------------------------------------------------------------------------------
../source/gcc-7.2.0/configure --prefix=$SYSROOT/usr --enable-gnu-indirect-function   --with-newlib --without-headers   --enable-languages=c --enable-threads=no   --disable-shared --disable-decimal-float   --disable-libsanitizer --disable-bootstrap  --disable-libquadmath --disable-libquadmath-support --disable-libssp
make
make install
-------------------------------------------------------------------------------------------
CC=$SYSROOT/usr/bin/gcc ../source/glibc-2.26/configure --with-pkgversion='GLIBC Build' --with-headers=$SYSROOT/usr/include --enable-obsolete-rpc --prefix=/usr --host=aarch64-linux-gnu
make
make DESTDIR=$SYSROOT install
-------------------------------------------------------------------------------------------
../source/gcc-7.2.0/configure --prefix=$SYSROOT/usr --with-sysroot=$SYSROOT --enable-languages=c,c++,fortran --enable-modules --enable-lto --enable-plugin --disable-libsanitizer --disable-bootstrap --enable-threads --enable-shared  --enable-checking=release --disable-werror --disable-multilib --with-cpu=thunderx2t99 --with-pkgversion='GCC Build' --enable-threads=posix --with-default-libstdcxx-abi=new --disable-libquadmath --disable-libquadmath-support --with-arch-directory=aarch64

make 
make install
------------------------------------------------------------------------------------------------------------
gcc -L${SYSROOT}/usr/lib64 -I${SYSROOT}/usr/include --sysroot=${SYSROOT} -Wl,-rpath=${SYSROOT}/usr/lib64 -Wl,--dynamic-linker=${SYSROOT}/lib/ld-linux-aarch64.so.1 test.c
---------------------------------------------------------------------------------------------


