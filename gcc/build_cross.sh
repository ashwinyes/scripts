GCC_SOURCE_DIR=/gcc_source_dir
BINUTILS_SOURCE_DIR=/binutils_source_dir
GLIBC_SOURCE_DIR=/glibc_source_dir
LINUX_SOURCE_DIR=/linux_source_dir

GCC_BUILD_DIR=/gcc_build_dir
BINUTILS_BUILD_DIR=/binutils_build_dir
GLIBC_BUILD_DIR=/glibc_build_dir
LINUX_BUILD_DIR=/linux_build_dir

PREFIX=/install_dir
GCC_PREFIX=$PREFIX
BINUTILS_PREFIX=$PREFIX
GLIBC_PREFIX=$PREFIX/aarch64-linux-gnu
LINUX_PREFIX=$PREFIX



export GCC_SOURCE_DIR=/home/ashwin/gcc/source/gcc
export BINUTILS_SOURCE_DIR=/home/ashwin/binutils/source/binutils-gdb
export GLIBC_SOURCE_DIR=/home/ashwin/glibc/source/glibc
export LINUX_SOURCE_DIR=/home/ashwin/linux/source/linux-source-4.4.0

export GCC_BUILD_DIR=/home/ashwin/gcc/build_aarch64
export BINUTILS_BUILD_DIR=/home/ashwin/binutils/build_aarch64
export GLIBC_BUILD_DIR=/home/ashwin/glibc/build_aarch64
export LINUX_BUILD_DIR=/home/ashwin/linux/build_aarch64

export PREFIX=/home/ashwin/gcc/build_aarch64/install-dir
export GCC_PREFIX=$PREFIX
export BINUTILS_PREFIX=$PREFIX
export GLIBC_PREFIX=$PREFIX/aarch64-linux-gnu
export LINUX_PREFIX=$PREFIX

export PATH=$PREFIX/bin:$PATH

cd $BINUTILS_BUILD_DIR
$BINUTILS_SOURCE_DIR/configure -v --prefix=$BINUTILS_PREFIX --target=aarch64-linux-gnu --disable-multilib
make
make install

cd $GCC_SOURCE_DIR
./contrib/download_prerequisites

cd $GCC_BUILD_DIR
$GCC_SOURCE_DIR/configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=aarch64-linux-gnu --prefix=$GCC_PREFIX --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib
make all-gcc
make all-host
make install-gcc
make install-host

cd $LINUX_BUILD_DIR
make -C $LINUX_SOURCE_DIR ARCH=arm64 INSTALL_HDR_PATH=$LINUX_PREFIX headers_install
make -C $LINUX_SOURCE_DIR ARCH=arm64 INSTALL_HDR_PATH=$LINUX_PREFIX/aarch64-linux-gnu headers_install

cd $GLIBC_BUILD_DIR
$GLIBC_SOURCE_DIR/configure -v --prefix=$GLIBC_PREFIX --build=x86_64-linux-gnu --host=aarch64-linux-gnu --target=aarch64-linux-gnu  --disable-multilib  --with-headers=$LINUX_PREFIX/include  libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes
make install-bootstrap-headers=yes install-headers
make $GLIBC_PREFIX/include/gnu/stubs.h
make $GLIBC_PREFIX/include/gnu/lib-names-lp64.h
make csu/subdir_lib
make csu/subdir_install

touch $GLIBC_PREFIX/include/gnu/stubs-lp64.h
aarch64-linux-gnu-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $GLIBC_PREFIX/lib/libc.so


cd $GCC_BUILD_DIR
make all-target-libgcc
make install-target-libgcc

cd $GLIBC_BUILD_DIR
make 
make sysdeps
make install

cd $GCC_BUILD_DIR
make
make install

