#! /bin/sh

# Copyright (C) 2000-2018 Peter Selinger.
# This file is part of ccrypt. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

# Check that the ccrypt program works properly in all different
# encryption/decryption modes.

if test -z "$srcdir"; then
    srcdir=.
fi

. "$srcdir/common.sh"

NAME="$0"

KEY=testkey
KEY2=newkey
KEYM=mismatchkey
CCRYPT="${CHECK_CCRYPT:-../src/ccrypt$EXEEXT} -f"
DATA="$srcdir"/testdata
DATAM="$srcdir"/testdata.m
CPTDATA="$srcdir"/testdata.cpt
UCPTDATA="$srcdir"/testdata.ucpt
TMP1=`mktemp "$TMPDIR/ccrypt-ccrypt-check-1.XXXXXX"`
TMP2=`mktemp "$TMPDIR/ccrypt-ccrypt-check-2.XXXXXX"`
DATA31="$srcdir"/testdata31
CPTDATA31="$srcdir"/testdata31.cpt
NULLDATA="$srcdir"/nulldata

cleanup () {
    rm -f "$TMP1" "$TMP1.cpt" "$TMP2" "$TMP2.cpt"
}

trap cleanup EXIT
trap cleanup INT

# check for a specific return value of a command
naction () {
    EXPECTED="$1"
    shift
    $@ 2>/dev/null
    RECEIVED="$?"
    if test "$RECEIVED" -ne "$EXPECTED"; then
	echo "$NAME:$LINE: Action returned $RECEIVED instead of $EXPECTED." >&2
	echo "$NAME: test failed." >&2
	echo "Failed command: $LINE: $@" >& 2
	exit 1
    fi
}

action () {
    naction 0 $@
}

# keep track of line numbers
alias action="LINE=\$LINENO; action"
alias naction="LINE=\$LINENO; naction"

decrypttest() {
    D="$1"
    C="$2"
    K="$3"

    action $CCRYPT -d -K "$K" < "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action cp "$C" "$TMP1".cpt
    action $CCRYPT -d -K "$K" "$TMP1".cpt
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action cp "$C" "$TMP1".cpt
    action $CCRYPT -d -T -K "$K" "$TMP1".cpt
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action $CCRYPT -c -K "$K" "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action $CCRYPT -c -K "$K" < "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action $CCRYPT -c -K "$K" - < "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"
}

decrypttest_m() {
    D="$1"
    C="$2"
    K="$3"

    action $CCRYPT -m -d -K "$K" < "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"

    action $CCRYPT -m -c -K "$K" "$C" > "$TMP1"
    action diff "$D" "$TMP1" > /dev/null
    action rm -f "$TMP1"
}

# test decryption

decrypttest "$DATA" "$CPTDATA" "$KEY"

# test decryption with non-matching key

decrypttest_m "$DATAM" "$CPTDATA" "$KEYM"

# test encryption

action $CCRYPT -K "$KEY" < "$DATA" > "$TMP2"
decrypttest "$DATA" "$TMP2" "$KEY"
action rm -f "$TMP2"

action cp "$DATA" "$TMP2"
action $CCRYPT -K "$KEY" "$TMP2"
decrypttest "$DATA" "$TMP2".cpt "$KEY"
action rm -f "$TMP2".cpt

action cp "$DATA" "$TMP2"
action $CCRYPT -T -K "$KEY" "$TMP2"
decrypttest "$DATA" "$TMP2".cpt "$KEY"
action rm -f "$TMP2".cpt

# test keychange

action $CCRYPT -x -K "$KEY" -H "$KEY2" < "$CPTDATA" > "$TMP2"
decrypttest "$DATA" "$TMP2" "$KEY2"
action rm -f "$TMP2"

action cp "$CPTDATA" "$TMP2"
action $CCRYPT -x -K "$KEY" -H "$KEY2" "$TMP2"
decrypttest "$DATA" "$TMP2" "$KEY2"
action rm -f "$TMP2"

# test unixcrypt compatibility

action $CCRYPT -u -K "$KEY" < "$UCPTDATA" > "$TMP2"
action diff "$TMP2" "$DATA" > /dev/null
action rm -f "$TMP2"

action $CCRYPT -u -K "$KEY" "$UCPTDATA" > "$TMP2"
action diff "$TMP2" "$DATA" > /dev/null
action rm -f "$TMP2"

# test that wrong keys are detected correctly

naction 4 $CCRYPT -d -K wrongkey < "$CPTDATA" > "$TMP2"
action diff "$TMP2" "$NULLDATA" > /dev/null
action rm -f "$TMP2"

naction 4 $CCRYPT -c -K wrongkey "$CPTDATA" > "$TMP2"
action diff "$TMP2" "$NULLDATA" > /dev/null
action rm -f "$TMP2"

action cp "$CPTDATA" "$TMP2"
naction 4 $CCRYPT -d -K wrongkey "$TMP2"
action diff "$CPTDATA" "$TMP2" > /dev/null
action rm -f "$TMP2"

naction 4 $CCRYPT -x -K wrongkey -H "$KEY2" < "$CPTDATA" > "$TMP2"
action diff "$TMP2" "$NULLDATA" > /dev/null
action rm -f "$TMP2"

action cp "$CPTDATA" "$TMP2"
naction 4 $CCRYPT -x -K wrongkey -H "$KEY2" "$TMP2"
action diff "$CPTDATA" "$TMP2" > /dev/null
action rm -f "$TMP2"

# test that short files are detected correctly

naction 4 $CCRYPT -d -K wrongkey < "$DATA31" > "$TMP2"
action diff "$TMP2" "$CPTDATA31" > /dev/null
action rm -f "$TMP2"

naction 4 $CCRYPT -c -K wrongkey "$DATA31" > "$TMP2"
action diff "$TMP2" "$CPTDATA31" > /dev/null
action rm -f "$TMP2"

action cp "$DATA31" "$TMP2"
naction 4 $CCRYPT -d -K wrongkey "$TMP2"
action diff "$DATA31" "$TMP2" > /dev/null
action rm -f "$TMP2"

naction 4 $CCRYPT -x -K wrongkey -H "$KEY2" < "$DATA31" > "$TMP2" 
action diff "$TMP2" "$CPTDATA31" > /dev/null
action rm -f "$TMP2"

action cp "$DATA31" "$TMP2"
naction 4 $CCRYPT -x -K wrongkey -H "$KEY2" "$TMP2"
action diff "$DATA31" "$TMP2" > /dev/null
action rm -f "$TMP2"

echo "$NAME: test succeeded" >&2
exit 0
