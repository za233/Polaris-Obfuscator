/* Copyright (C) 2000-2018 Peter Selinger.
   This file is part of ccrypt. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "rijndael-alg-ref.h"
#include "../src/rijndael.h"

/* check to see if the optimized Rijndael implementation agrees with
   the reference implementation. The three files boxes-ref.dat,
   rijndael-alg-ref.c, and rijndael-alg-ref.h contain the original,
   unmodified ANSI C reference code of Rijndael by Paulo Barreto and
   Vincent Rijmen. */

int main() {
  word8 rk[MAXROUNDS+1][4][MAXBC];
  word8 k[4][MAXKC];
  word8 a[4][MAXBC];
  word8 a0[4][MAXBC];
  roundkey rkk;
  xword32 k1_32[MAXKC];
  xword32 a1_32[MAXBC];
  char* k1 = (char *)k1_32;
  char* a1 = (char *)a1_32;

  int seed = time(0);
  int BC, KC, i, j, d, total=0;

  /* for each combination of key size / block size, check encryption
     and decryption of a random block */

  printf("Random seed: %d\n", seed);

  srand(seed);

  for (KC=4; KC<=8; KC+=2)
    for (BC=4; BC<=8; BC+=2) {

      /* generate random key and block */
      for (i=0; i<4; i++)
	for (j=0; j<BC; j++)
	  a0[i][j] = a[i][j] = a1[j*4+i] = (word8) rand();
	  
      for (i=0; i<4; i++)
	for (j=0; j<KC; j++)
	  k[i][j] = k1[j*4+i] = (word8) rand();

      /* generate round keys */
      rijndaelKeySched (k, KC*32, BC*32, rk);
      xrijndaelKeySched (k1_32, KC*32, BC*32, &rkk);
      
      /* encrypt */
      rijndaelEncrypt (a, KC*32, BC*32, rk);
      xrijndaelEncrypt (a1_32, &rkk);

      /* test difference */
      d = 0;
      for (i=0; i<4; i++)
	for (j=0; j<BC; j++)
	  if (a[i][j] != (word8) a1[j*4+i]) {
	    printf("BC=%d, KC=%d, ", BC, KC);
	    printf("Encryption: difference a[i][j]=%d, a1[j*4+i]=%d\n", a[i][j], a1[j*4+i]);
	    d++; total++;
	  }
      if (d) printf("Encryption: %d differences\n", d);

      /* decrypt */
      rijndaelDecrypt (a, KC*32, BC*32, rk);
      xrijndaelDecrypt (a1_32, &rkk);

      /* test difference */
      d = 0;
      for (i=0; i<4; i++)
	for (j=0; j<BC; j++)
	  if (a[i][j] != (word8) a1[j*4+i]) {
	    printf("BC=%d, KC=%d, ", BC, KC);
	    printf("Decryption: difference a[i][j]=%d, a1[j*4+i]=%d\n", a[i][j], a1[j*4+i]);
	    d++; total++;
	  }
      if (d) printf("Decryption: %d differences\n", d);

      /* test difference to original */
      d = 0;
      for (i=0; i<4; i++)
	for (j=0; j<BC; j++)
	  if (a0[i][j] != (word8) a1[j*4+i]) {
	    printf("BC=%d, KC=%d, ", BC, KC);
	    printf("Inverse difference a0[i][j]=%d, a1[j*4+i]=%d\n", a0[i][j], a1[j*4+i]);
	    d++; total++;
	  }
      if (d) printf("Inverse: %d differences\n", d);
    }         
  printf("Total: %d differences\n", total);

  if (total) {
    printf("The optimized Rijndael implementation does not agree with the reference implementation.\n");
    return 1;
  }

  printf("The optimized Rijndael implementation agrees with the reference implementation.\n");
  return 0;
}
