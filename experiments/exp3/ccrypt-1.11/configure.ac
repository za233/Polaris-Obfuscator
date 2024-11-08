dnl  Copyright (C) 2000-2018 Peter Selinger.
dnl  This file is part of ccrypt. It is free software and it is covered
dnl  by the GNU general public license. See the file COPYING for details.

dnl  Process this file with autoconf to produce a configure script.

dnl ----------------------------------------------------------------------
AC_INIT([ccrypt], [1.11], [selinger at users.sourceforge.net])
AC_CONFIG_SRCDIR([src/ccrypt.c])
AM_INIT_AUTOMAKE
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

DATE="July 2018"

dnl ----------------------------------------------------------------------
dnl  Find lisp installation directory
AM_PATH_LISPDIR

dnl ----------------------------------------------------------------------
dnl  The names of the installed executables and the default suffix are in
dnl  principle configurable. However, they should not normally be changed,
dnl  because other scripts might depend on them.

NAMECCRYPT=ccrypt
NAMEENCRYPT=ccencrypt
NAMEDECRYPT=ccdecrypt
NAMECAT=ccat
SUF=.cpt

dnl Upper case name
NAMEUC=`echo $NAMECCRYPT | tr a-z A-Z`

dnl ----------------------------------------------------------------------
dnl Export some parameters to config file
AC_DEFINE_UNQUOTED(NAMECCRYPT,"$NAMECCRYPT",Name of the ccrypt binary)
AC_DEFINE_UNQUOTED(NAMEENCRYPT,"$NAMEENCRYPT",Name of the ccencrypt binary)
AC_DEFINE_UNQUOTED(NAMEDECRYPT,"$NAMEDECRYPT",Name of the ccdecrypt binary)
AC_DEFINE_UNQUOTED(NAMECAT,"$NAMECAT",Name of the ccat binary)
AC_DEFINE_UNQUOTED(SUF,"$SUF",Default suffix for encrypted files)

dnl ----------------------------------------------------------------------
dnl Check for C compiler and flags
AC_PROG_CC([gcc clang cc c99 mgcc c89 pcc opencc sunc99 suncc])
AC_USE_SYSTEM_EXTENSIONS

dnl Also add CADD to the CFLAGS at configure time or compile time
AC_SUBST(CADD)

AC_MSG_CHECKING(what compiler options to use)
AC_MSG_RESULT($CADD $CFLAGS)

dnl ----------------------------------------------------------------------
dnl Check for other programs

AC_CHECK_PROGS(TAR, gtar, tar)

dnl ----------------------------------------------------------------------
dnl enable large file support

AC_SYS_LARGEFILE

dnl ----------------------------------------------------------------------
dnl check for features

AC_ARG_ENABLE(libcrypt,
 AS_HELP_STRING([--disable-libcrypt],[do not link against libcrypt, use own replacement]))

AC_ARG_ENABLE(emacs,
 AS_HELP_STRING([--disable-emacs],[omit emacs support]),
 if test "$enableval" = no; then
     EMACS=no
 fi   
)

dnl ----------------------------------------------------------------------
dnl Checks for libraries.

dnl Unless explicitly disabled, link against libcrypt if possible
if test "$enable_libcrypt" != no; then
  AC_CHECK_LIB(crypt, crypt)
fi

dnl If not linking against libcrypt, must link against replacement
if test "$ac_cv_lib_crypt_crypt" != yes; then
   EXTRA_OBJS="$EXTRA_OBJS unixcrypt3.o"
fi

dnl SCO Open Server requires -lsocket for gethostname()
AC_CHECK_LIB(socket, gethostname)

dnl ----------------------------------------------------------------------
dnl Checks for header files.
AC_CHECK_HEADERS(stdint.h crypt.h)

dnl ----------------------------------------------------------------------
dnl Checks for library functions.

dnl Check for getopt_long
AC_CHECK_FUNC(getopt_long, have_getopt_long=yes, have_getopt_long=no)
if test "$have_getopt_long" = "yes"; then
   dnl Check whether getopt_long reorders its arguments
   AC_MSG_CHECKING([whether getopt_long reorders its arguments])
   AC_RUN_IFELSE([AC_LANG_PROGRAM(
   [[ #include <getopt.h>
      static struct option longopts[] = {
        {"help", 0, 0, 'h'},
	{0, 0, 0, 0}
      };
   ]], 
   [[ int ac = 3;
      char *av[] = { "main", "file", "-h" };
      return 'h' == getopt_long(ac, av, "h", longopts, (int *)0) ? 0 : 1;
   ]])], 
   [AC_MSG_RESULT(yes)], 
   [AC_MSG_RESULT(no)
   have_getopt_long=no],
   [AC_MSG_RESULT(maybe (cross-compiling))
   have_getopt_long=no])
fi

AC_ARG_WITH(included-getopt,
 AS_HELP_STRING([--with-included-getopt],[avoid using the system-wide getopt library]))

AC_MSG_CHECKING(whether to use included getopt)
if test "$have_getopt_long" != "yes" || test "$with_included_getopt" = yes; then 
   EXTRA_OBJS="$EXTRA_OBJS getopt.o getopt1.o"
   EXTRA_INCLUDES="$EXTRA_INCLUDES -I\$(srcdir)/include/getopt"
   AC_MSG_RESULT(yes)
else
   AC_MSG_RESULT(no)
fi

dnl ----------------------------------------------------------------------
dnl Find sizes of some types
AC_CHECK_SIZEOF(unsigned int, 4)
AC_CHECK_SIZEOF(unsigned long, 4)

dnl Determine 32-bit unsigned integer type
AC_MSG_CHECKING([for 32 bit unsigned integer type])
if test "$ac_cv_sizeof_unsigned_int" -eq 4; then
   UINT32_TYPE="unsigned int";
elif test "$ac_cv_sizeof_unsigned_long" -eq 4; then
   UINT32_TYPE="unsigned long";
else
AC_MSG_ERROR(cannot find 32 bit integer type)
fi
AC_MSG_RESULT($UINT32_TYPE)
AC_DEFINE_UNQUOTED(UINT32_TYPE,$UINT32_TYPE,unsigned 32 bit integer type)

dnl ----------------------------------------------------------------------
dnl Internationalization

GETTEXT_PACKAGE=ccrypt
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [Package name for gettext])

AM_GNU_GETTEXT
AM_GNU_GETTEXT_VERSION([0.19.8])
dnl IT_PO_SUBDIR(po)

dnl ----------------------------------------------------------------------
dnl Libtool (needed by intl/)

LT_INIT

dnl ----------------------------------------------------------------------
dnl Set up substitutions of non-standard configuration parameters
AC_SUBST(NAMECCRYPT)
AC_SUBST(NAMEENCRYPT)
AC_SUBST(NAMEDECRYPT)
AC_SUBST(NAMECAT)
AC_SUBST(SUF)
AC_SUBST(DATE)
AC_SUBST(NAMEUC)
AC_SUBST(EXTRA_OBJS)
AC_SUBST(EXTRA_INCLUDES)
AC_SUBST(TAR)

dnl ----------------------------------------------------------------------
AC_CONFIG_FILES([doc/ccrypt.1
	   doc/ccguess.1
	   po/Makefile.in 
	   m4/Makefile 
	   intl/Makefile 
	   Makefile 
	   src/Makefile 
	   emacs/Makefile
	   check/Makefile
	   doc/Makefile
          ])
AC_OUTPUT
