/* Copyright (C) 2000-2018 Peter Selinger.
   This file is part of ccrypt. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* user interface for ccrypt: casual encryption and decryption for files */

#ifndef __MAIN_H
#define __MAIN_H

/* modes */
#define ENCRYPT   0
#define DECRYPT   1
#define KEYCHANGE 2
#define CAT       3
#define UNIXCRYPT 4

/* structure to hold command-line */
typedef struct {
  const char *name;  /* invocation name: "NAMECCRYPT", "NAMECAT", etc */
  int verbose;       /* -1=quiet, 0=normal, 1=verbose */
  int debug;    
  char *keyword;
  char *keyword2;    /* when changing keys: new key */
  int mode;          /* ENCRYPT, DECRYPT, KEYCHANGE, CAT, UNIXCRYPT */
  int filter;        /* running as a filter? */
  int tmpfiles;      /* use temporary files instead of overwriting? */
  const char *suffix;
  const char *prompt;
  const char *prompt2;
  int recursive;     /* 0=non-recursive, 1=directories, 2=dirs and symlinks */
  int symlinks;      /* operate on files that are symbolic links? */
  int force;         /* overwrite existing files without asking? */
  int mismatch;      /* allow decryption with non-matching key? */
  char **infiles;    /* list of filenames */
  int count;         /* number filenames */
  char *keyfile;     /* file to read key(s) from */
  int timid;         /* prompt twice for encryption keys? */
  char *keyref;      /* if set, compare encryption key to this file */
  int strictsuffix;  /* refuse to encrypt files which already have suffix */
} cmdline;

extern cmdline cmd;

#endif /* __MAIN_H */
