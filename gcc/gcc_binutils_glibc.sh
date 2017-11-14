#gcc+binutils+glibc

BINUTILSSRCDIR=/path/to/binutils
LINUXSRCDIR=/path/to/linux
GCCSRCDIR=/path/to/gcc
GLIBCSRCDIR=/path/to/glibc
INSTALLDIR=/install/dir

export PATH=$INSTALLDIR/usr/bin:$PATH
export LD_LIBRARY_PATH=$INSTALLDIR/usr/lib:$INSTALLDIR/usr/lib64

#Binutils build
$BINUTILSSRCDIR/configure --with-sysroot=$INSTALLDIR --prefix=/usr
make -j
make DESTDIR=$INSTALLDIR install

#linux headers install
make headers_install ARCH=arm64 INSTALL_HDR_PATH=$INSTALLDIR/usr \
     HOSTCC=/usr/bin/gcc -C $LINUXSRCDIR

#GCC first build
$GCCSRCDIR/configure --prefix=/usr --enable-gnu-indirect-function \
    --with-newlib --without-headers --enable-languages=c \
    --enable-threads=no --disable-shared --disable-decimal-float \
    --disable-libsanitizer --disable-bootstrap --disable-libquadmath \
    --disable-libquadmath-support --disable-libssp
make -j
make DESTDIR=$INSTALLDIR install

#GLIBC build
$GLIBCSRCDIR/configure --with-headers=$INSTALLDIR/usr/include \
   --enable-obsolete-rpc \
   --prefix=/usr --host=aarch64-linux-gnu

make -j
make DESTDIR=$INSTALLDIR install 

#GCC full build in a fresh directory
$GCCSRCDIR/configure --prefix=$INSTALLDIR/usr --with-sysroot=$INSTALLDIR \
   --enable-languages=c,c++,fortran
make -j
make DESTDIR=$INSTALLDIR install

#Required CFLAGS
# set the sysroot for finding all default paths
CFLAGS="--sysroot=${INSTALLDIR}"

#search the old include paths after the new default paths
CFLAGS=" $CFLAGS -idirafter /usr/include -idirafter /usr/include/aarch64-linux-gnu"

# change the loader
CFLAGS=" $CFLAGS -Wl,--dynamic-linker=${SYSROOT}/lib64/ld-2.26.so"

# embed the new default load library path in the binary
CFLAGS=" $CFLAGS -Wl,-rpath=${SYSROOT}/lib64 "
CFLAGS=" $CFLAGS -Wl,-rpath=${SYSROOT}/usr/lib64 "
CFLAGS=" $CFLAGS-Wl,-rpath=${SYSROOT}/usr/lib "

# search the old library paths after the new default paths.
# using -L will not work as it will make the compiler search
# those paths before the new default paths. So old libc will be
# linked
export LIBRARY_PATH=/usr/lib:/usr/lib/aarch64-linux-gnu
