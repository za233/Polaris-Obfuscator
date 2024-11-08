/* Copyright (C) 2000-2018 Peter Selinger.
   This file is part of ccrypt. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* unixcryptlib.c: library to simulate old "unix crypt" program */

/* WARNING: do not use this software for encryption! The encryption
   provided by this program has been broken and is not secure. Only
   use this software to decrypt existing data. */

#ifndef _UNIXCRYPTLIB_H
#define _UNIXCRYPTLIB_H

#include "ccryptlib.h"

int unixcrypt_init(ccrypt_stream_t *b, const char *key);
int unixcrypt(ccrypt_stream_t *b);
int unixcrypt_end(ccrypt_stream_t *b);

#endif /* _UNIXCRYPTLIB_H */
