#! /bin/sh

# Copyright (C) 2000-2018 Peter Selinger.
# This file is part of ccrypt. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

# Check that the ccrypt program works properlywith various different
# filelengths, in various different encryption modes.

if test -z "$srcdir"; then
    srcdir=.
fi

. "$srcdir"/common.sh

NAME="$0"

KEY=testkey
KEY2=newkey
CCRYPT="${CHECK_CCRYPT:-../src/ccrypt$EXEEXT} -f"
DATA=`mktemp "$TMPDIR/ccrypt-length-check-1.XXXXXX"`
TMP1=`mktemp "$TMPDIR/ccrypt-length-check-2.XXXXXX"`
TMP2=`mktemp "$TMPDIR/ccrypt-length-check-3.XXXXXX"`

cleanup () {
    rm -f "$DATA" "$TMP1" "$TMP1.cpt" "$TMP2" "$TMP2.cpt"
}

trap cleanup EXIT
trap cleanup INT

action () {
    $@
    if test $? -ne 0; then
	echo "$NAME: test failed for file length $LEN." >&2
	exit 1
    fi
}

# run test suite on a file of the given length 
testfilelength() {
    L="$1"

    # make file of length $L
    if test "$L" -eq 0; then
	# circumvent dd bug in solaris
        cat /dev/null > "$DATA"
    else
        dd if=/dev/zero of="$DATA" bs=1 count="$L" 2>/dev/null

    fi
    
    # run tests: encryption and keychange
    action $CCRYPT -K "$KEY" < "$DATA" > "$TMP1"
    action $CCRYPT -x -K "$KEY" -H "$KEY2" < "$TMP1" > "$TMP2"
    decrypttest "$DATA" "$TMP2" "$KEY2"
    action rm -f "$TMP2" "$TMP1"

    action cp "$DATA" "$TMP2"
    action $CCRYPT -K "$KEY" "$TMP2"
    action $CCRYPT -x -K "$KEY" -H "$KEY2" "$TMP2"
    decrypttest "$DATA" "$TMP2.cpt" "$KEY2"
    action rm -f "$TMP2.cpt"

    # test unixcrypt

    action $CCRYPT -u -K "$KEY" < "$DATA" > "$TMP1"
    action $CCRYPT -u -K "$KEY" < "$TMP1" > "$TMP2"
    action diff "$TMP2" "$DATA"
    action rm -f "$TMP2" "$TMP1"
}

decrypttest() {
    D="$1"
    C="$2"
    K="$3"

    action $CCRYPT -d -K "$K" < "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action cp "$C" "$TMP1.cpt"
    action $CCRYPT -d -K "$K" "$TMP1.cpt"
    action diff "$D" "$TMP1"
    action rm -f "$TMP1"

    action $CCRYPT -c -K "$K" "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"
}

# run test for different critical file lengths

for L in 0 1 2 31 32 33 63 64 65 \
    959 960 961 991 992 993 1023 1024 1025 1055 1056 1057 \
    10207 10208 10209 10239 10240 10241 10271 10272 10273; do
    LEN="$L"
    testfilelength "$L"
done

action rm -f "$DATA" "$TMP1" "$TMP1.cpt" "$TMP2" "$TMP2.cpt"

echo "$NAME: test succeeded" >&2
exit 0
