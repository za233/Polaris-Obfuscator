## Copyright (C) 2000-2018 Peter Selinger.
## This file is part of ccrypt. It is free software and it is covered
## by the GNU general public license. See the file COPYING for details.

## Process this file with automake to produce Makefile.in

AM_CFLAGS = $(CADD)

TESTS = rijndael-check$(EXEEXT) length-check.sh ccrypt-check.sh crypt3-check$(EXEEXT)

check_PROGRAMS = rijndael-check crypt3-check
check_SCRIPTS = ccrypt-check.sh length-check.sh largefile-check.sh

EXTRA_DIST = ccrypt-check.sh length-check.sh testdata testdata.cpt testdata.ucpt testdata31 testdata31.cpt testdata.m common.sh largefile-check.sh nulldata

rijndael_check_SOURCES = rijndael-check.c rijndael-alg-ref.c rijndael-alg-ref.h boxes-ref.dat
rijndael_check_LDADD = ../src/rijndael.o ../src/tables.o
rijndael_check_DEPENDENCIES = ../src/rijndael.o ../src/tables.o

crypt3_check_DEPENDENCIES = ../src/unixcrypt3.o
crypt3_check_LDADD = @LIBS@ ../src/unixcrypt3.o

../src/rijndael.o ../src/tables.o:
	(cd ../src && $(MAKE) $(AM_MAKEFLAGS) rijndael.o tables.o)

../src/unixcrypt3.o:
	(cd ../src && $(MAKE) $(AM_MAKEFLAGS) unixcrypt3.o)

