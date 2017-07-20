GLIBC_INSTALL_PATH=/home/ashwin/glibc/build/install-dir
GCC_INSTALL_PATH=/home/ashwin/gcc/build/install-dir

gcc -nostdinc -I$GCC_INSTALL_PATH/lib/gcc/aarch64-linux-gnu/7.0.1/include \
-I$GLIBC_INSTALL_PATH/include \
-Wl,--rpath=$GLIBC_INSTALL_PATH/lib -Wl,--dynamic-linker=$GLIBC_INSTALL_PATH/lib/ld-linux-aarch64.so.1 \
"$@"


GLIBCDIR = $(GLIBC_INSTALL_PATH)/lib
STARTFILES = $(GLIBCDIR)/crt1.o $(GLIBCDIR)/crti.o `gcc --print-file-name=crtbegin.o`
ENDFILES = `gcc --print-file-name=crtend.o` $(GLIBCDIR)/crtn.o
LIBGROUP = -Wl,--start-group $(GLIBCDIR)/libc.so -lgcc -lgcc_eh -Wl,--end-group

#CFLAGS +=-nostdlib -nostartfiles
#CFLAGS +=$(STARTFILES) $(LIBGROUP) $(ENDFILES)
CFLAGS +=-nodefaultlibs
#CFLAGS +=$(LIBGROUP)
