---
layout: default
type: book
promote: 0
status: 1
created_ts: 1155313692
changed_ts: 1159004663
node_id: 1682
title: What OS and compiler is this?
created: '2006-08-11'
changed: '2006-09-23'
redirect_from:
- "/node/1682/"
permalink: "/2006/08/11/what_os_and_compiler_is_this/"
tags:
- Geek
---
I was trying to find out how to tell, from within a C program under GCC, what OS the code was being compiled under.  I was porting [RPCemu](http://b-em.bbcmicro.com/arculator/) to MacOSX, and wanted to switch between [big and little endian](http://en.wikipedia.org/wiki/Endianness) code without doing something clunky in [autoconf](http://www.gnu.org/software/autoconf/).  
<!--break-->
I [Googled](http://www.google.co.uk) for lists of pre-defined C pre-processor macros, but found didn't find any.  Eventually, I discovered that you can get a list of the macros under GCC on a particular platform by creating an empty c file (<tt>empty.c</tt>) and running this command:
 gcc -std=c99 -E -dM empty.c

#  Linux - gcc (GCC) 3.2.3 20030502 (Red Hat Linux 3.2.3-56)
 #define __HAVE_BUILTIN_SETJMP__ 1
 #define __unix__ 1
 #define __i386__ 1
 #define __SIZE_TYPE__ unsigned int
 #define __ELF__ 1
 #define __GNUC_PATCHLEVEL__ 3
 #define __GNUC_RH_RELEASE__ 56
 #define __linux 1
 #define __unix 1
 #define __linux__ 1
 #define __STDC_VERSION__ 199901L
 #define __USER_LABEL_PREFIX__ 
 #define __STDC_HOSTED__ 1
 #define __WCHAR_TYPE__ long int
 #define __gnu_linux__ 1
 #define __WINT_TYPE__ unsigned int
 #define __GNUC__ 3
 #define __STRICT_ANSI__ 1
 #define __GXX_ABI_VERSION 102
 #define __GNUC_MINOR__ 2
 #define __STDC__ 1
 #define __PTRDIFF_TYPE__ int
 #define __tune_i386__ 1
 #define __REGISTER_PREFIX__ 
 #define __NO_INLINE__ 1
 #define __i386 1
 #define __VERSION__ "3.2.3 20030502 (Red Hat Linux 3.2.3-56)"

#  Mac - powerpc-apple-darwin8-gcc-4.0.1 (GCC) 4.0.1 (Apple Computer, Inc. build 5341)
 #define __DBL_MIN_EXP__ (-1021)
 #define __FLT_MIN__ 1.17549435e-38F
 #define __CHAR_BIT__ 8
 #define __WCHAR_MAX__ 2147483647
 #define __DBL_DENORM_MIN__ 4.9406564584124654e-324
 #define __FLT_EVAL_METHOD__ 0
 #define __DBL_MIN_10_EXP__ (-307)
 #define __FINITE_MATH_ONLY__ 0
 #define __GNUC_PATCHLEVEL__ 1
 #define __SHRT_MAX__ 32767
 #define __LDBL_MAX__ 1.79769313486231580793728971405301e+308L
 #define __APPLE_CC__ 5341
 #define __UINTMAX_TYPE__ long long unsigned int
 #define __LDBL_MAX_EXP__ 1024
 #define __SCHAR_MAX__ 127
 #define __USER_LABEL_PREFIX__ _
 #define __STDC_HOSTED__ 1
 #define __LDBL_HAS_INFINITY__ 1
 #define __DBL_DIG__ 15
 #define __FLT_EPSILON__ 1.19209290e-7F
 #define __LDBL_MIN__ 2.00416836000897277799610805135016e-292L
 #define __ppc__ 1
 #define __strong 
 #define __APPLE__ 1
 #define __DECIMAL_DIG__ 33
 #define __LDBL_HAS_QUIET_NAN__ 1
 #define __DYNAMIC__ 1
 #define __GNUC__ 4
 #define __DBL_MAX__ 1.7976931348623157e+308
 #define __DBL_HAS_INFINITY__ 1
 #define __STRICT_ANSI__ 1
 #define __weak 
 #define __DBL_MAX_EXP__ 1024
 #define __LONG_LONG_MAX__ 9223372036854775807LL
 #define __GXX_ABI_VERSION 1002
 #define __FLT_MIN_EXP__ (-125)
 #define __DBL_MIN__ 2.2250738585072014e-308
 #define __DBL_HAS_QUIET_NAN__ 1
 #define __REGISTER_PREFIX__ 
 #define __NO_INLINE__ 1
 #define _ARCH_PPC 1
 #define __FLT_MANT_DIG__ 24
 #define __VERSION__ "4.0.1 (Apple Computer, Inc. build 5341)"
 #define __BIG_ENDIAN__ 1
 #define __SIZE_TYPE__ long unsigned int
 #define __FLT_RADIX__ 2
 #define __LDBL_EPSILON__ 4.94065645841246544176568792868221e-324L
 #define __NATURAL_ALIGNMENT__ 1
 #define __FLT_HAS_QUIET_NAN__ 1
 #define __FLT_MAX_10_EXP__ 38
 #define __LONG_MAX__ 2147483647L
 #define __FLT_HAS_INFINITY__ 1
 #define __STDC_VERSION__ 199901L
 #define _BIG_ENDIAN 1
 #define __LDBL_MANT_DIG__ 106
 #define __WCHAR_TYPE__ int
 #define __FLT_DIG__ 6
 #define __INT_MAX__ 2147483647
 #define __LONG_DOUBLE_128__ 1
 #define __FLT_MAX_EXP__ 128
 #define __DBL_MANT_DIG__ 53
 #define __WINT_TYPE__ int
 #define __LDBL_MIN_EXP__ (-968)
 #define __MACH__ 1
 #define __LDBL_MAX_10_EXP__ 308
 #define __DBL_EPSILON__ 2.2204460492503131e-16
 #define __INTMAX_MAX__ 9223372036854775807LL
 #define __FLT_DENORM_MIN__ 1.40129846e-45F
 #define __PIC__ 1
 #define __FLT_MAX__ 3.40282347e+38F
 #define __FLT_MIN_10_EXP__ (-37)
 #define __INTMAX_TYPE__ long long int
 #define __GNUC_MINOR__ 0
 #define __DBL_MAX_10_EXP__ 308
 #define __LDBL_DENORM_MIN__ 4.94065645841246544176568792868221e-324L
 #define __PTRDIFF_TYPE__ int
 #define __LDBL_MIN_10_EXP__ (-291)
 #define __LDBL_DIG__ 31
 #define __POWERPC__ 1

