make TARGET=ARMV7 NO_LAPACK=1 USE_THREAD=0 HOSTCC=gcc AR=ar CC="clang -target arm-eabi-v7a -marm -mfpu=vfp -mfloat-ab
i=softfp -I/home/ashwin/workspace/android/sdk/ndk-bundle/platforms/android-23/arch-arm/usr/include --sysroot /home/ashw
in/workspace/android/sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/arm-linux-androideabi --
gcc-toolchain=/home/ashwin/workspace/android/sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64"
 ONLY_CBLAS=1 -j4                                                                                                      
