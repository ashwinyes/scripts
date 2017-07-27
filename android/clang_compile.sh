###############ARMV7#####################
export NDK_ROOT=/home/ashwin/workspace/android/sdk/ndk-bundle
export LDFLAGS="-L${NDK_ROOT}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/lib/gcc/arm-linux-androideabi/4.9.x"
export FLAGS="-target arm-linux-androideabi -marm -mfpu=vfp -mfloat-abi=softfp --sysroot ${NDK_ROOT}/platforms/android-23/arch-arm"

#OpenBLAS Compile
make TARGET=ARMV7 NO_LAPACK=1 USE_THREAD=0 AR=ar CC="clang ${FLAGS}" HOSTCC=gcc ONLY_CBLAS=1 -j4


###############AARCH64#####################
export NDK_ROOT=/path/to/ndk-bundle/

# Export PATH to contain directories of clang and aarch64-linux-android-ld
export PATH=${NDK_ROOT}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/:${NDK_ROOT}/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

# Setup LDFLAGS so that loader can find libgcc and pass -lm for sqrt
export LDFLAGS="-L${NDK_ROOT}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/lib/gcc/aarch64-linux-android/4.9.x -lm"

# Setup the clang cross compile options
export TARGET_TRIPLET="-target aarch64-linux-android"
export SYSROOT_OPTION="--sysroot ${NDK_ROOT}/platforms/android-23/arch-arm64"

# Compile
make TARGET=ARMV8 NO_LAPACK=1 USE_THREAD=0 AR=ar CC="clang ${TARGET_TRIPLET} ${SYSROOT_OPTION}"  HOSTCC=gcc ONLY_CBLAS=1 -j4
                                                                                           

