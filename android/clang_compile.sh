export NDK_ROOT=/home/ashwin/workspace/android/sdk/ndk-bundle
export LDFLAGS="-L${NDK_ROOT}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/lib/gcc/arm-linux-androideabi/4.9.x"
export FLAGS="-target arm-linux-androideabi -marm -mfpu=vfp -mfloat-abi=softfp --sysroot ${NDK_ROOT}/platforms/android-23/arch-arm"

#OpenBLAS Compile
make TARGET=ARMV7 NO_LAPACK=1 USE_THREAD=0 AR=ar CC="clang ${FLAGS}" HOSTCC=gcc ONLY_CBLAS=1 -j4
                                                                                           

