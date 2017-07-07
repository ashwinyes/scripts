export AR=ar
export NDK_ROOT=/ndk

clang -target arm-linux-androideabi -marm -mfpu=vfp -mfloat-abi=softfp \
--sysroot $(NDK_ROOT)/platforms/android-23/arch-arm \
-L$(NDK_ROOT)/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/lib/gcc/arm-linux-androideabi/4.9.x \
$1
