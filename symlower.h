/* Force the link phase to use an older GLIBC version symbol for memcpy */
__asm__(".symver memcpy,memcpy@GLIBC_2.2.5");

