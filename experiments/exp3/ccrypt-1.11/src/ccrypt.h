/* Copyright (C) 2000-2018 Peter Selinger.
   This file is part of ccrypt. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* ccrypt.c: high-level functions for accessing ccryptlib */

/* ccrypt implements a stream cipher based on the block cipher
   Rijndael, the candidate for the AES standard. */

#include <stdio.h>
#include <errno.h>
#include <string.h>

#include "ccryptlib.h"

const char *ccrypt_error(int st);

int ccencrypt_streams(FILE *fin, FILE *fout, const char *key);
int ccdecrypt_streams(FILE *fin, FILE *fout, const char *key);
int cckeychange_streams(FILE *fin, FILE *fout, const char *key1, const char *key2);
int unixcrypt_streams(FILE *fin, FILE *fout, const char *key);
int keycheck_stream(FILE *fin, const char *key);

int ccencrypt_file(int fd, const char *key);
int ccdecrypt_file(int fd, const char *key);
int cckeychange_file(int fd, const char *key1, const char *key2);
int unixcrypt_file(int fd, const char *key);
