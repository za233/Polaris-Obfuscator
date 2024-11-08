## Copyright (C) 2000-2018 Peter Selinger.
## This file is part of ccrypt. It is free software and it is covered
## by the GNU general public license. See the file COPYING for details.

## Process this file with automake to produce Makefile.in

AM_CFLAGS = $(CADD)

# programs
bin_PROGRAMS = ccrypt ccguess

ccrypt_SOURCES = main.c main.h traverse.c traverse.h xalloc.c xalloc.h	\
  readkey.c readkey.h ccrypt.c ccrypt.h unixcryptlib.c unixcryptlib.h	\
  gettext.h platform.h platform.c
ccrypt_LDADD = @EXTRA_OBJS@ libccrypt.a
ccrypt_DEPENDENCIES = @EXTRA_OBJS@ libccrypt.a

ccguess_SOURCES = ccguess.c rijndael.h rijndael.c tables.h tables.c lists.h readkey.c readkey.h xalloc.c xalloc.h

# libraries
noinst_LIBRARIES = libccrypt.a
libccrypt_a_SOURCES = ccryptlib.c ccryptlib.h rijndael.h rijndael.c tables.h tables.c platform.h

# stuff that automake can't figure out on its own
EXTRA_DIST = getopt.c getopt1.c include/getopt/getopt.h unixcrypt3.c unixcrypt3.h maketables.c
MOSTLYCLEANFILES = maketables
MAINTAINERCLEANFILES = tables.c

# generated sources
maketables: maketables.c

# Note: tables.c is a maintainer-generated file that is included in
# the tarball distribution. The reason we make tables.c depend on
# maketables.c, and not on maketables, is that the latter is not
# distributed (and therefore tables.c would always have to be
# rebuilt). The recursive invocation of make should be safe even in a
# parallel build, because it does not build any additional targets.
tables.c: maketables.c
	$(MAKE) maketables
	./maketables > tables.c

# install/uninstall symbolic links
install-exec-hook:
	test "@NAMECCRYPT@" = ccrypt || \
	mv -f $(DESTDIR)$(bindir)/ccrypt $(DESTDIR)$(bindir)/@NAMECCRYPT@
	ln -f -s @NAMECCRYPT@ $(DESTDIR)$(bindir)/@NAMEENCRYPT@
	ln -f -s @NAMECCRYPT@ $(DESTDIR)$(bindir)/@NAMEDECRYPT@
	ln -f -s @NAMECCRYPT@ $(DESTDIR)$(bindir)/@NAMECAT@

uninstall-local:
	rm -f $(DESTDIR)$(bindir)/@NAMECCRYPT@
	rm -f $(DESTDIR)$(bindir)/@NAMEENCRYPT@
	rm -f $(DESTDIR)$(bindir)/@NAMEDECRYPT@
	rm -f $(DESTDIR)$(bindir)/@NAMECAT@

# internationalization stuff
localedir = $(datadir)/locale
AM_CPPFLAGS = @EXTRA_INCLUDES@ -I../intl -I$(top_srcdir)/intl -DLOCALEDIR=\"$(localedir)\"
LIBS = @LIBINTL@ @LIBS@
