#! /bin/sh

# Copyright (C) 2000-2018 Peter Selinger.
# This file is part of ccrypt. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

# Check that ccrypt works correctly on very large (>4GB) files in
# overwrite mode. Note that this test requires a LOT of disk space.
# Therefore, it is not routinely included in the "make check" target.

# Usage: largefile-check.sh [dir]

if test -z "$srcdir"; then
    srcdir=.
fi

. "$srcdir"/common.sh

NAME="$0"
CCRYPT="${CHECK_CCRYPT:-../src/ccrypt$EXEEXT} -f"

if test "$1"; then
    TMPDIR="$1"
fi

DATA=`mktemp "$TMPDIR/ccrypt-largefile-check-XXXXXX"`

cleanup () {
    rm -rf "$DATA"
    rm -rf "$DATA.cpt"
}

trap cleanup EXIT
trap cleanup INT

action () {
    "$@"
    if test $? -ne 0; then
	echo "$NAME: test failed" >& 2
	echo "Failed command: $LINE: $@" >& 2
	cleanup
	exit 1
    fi
}

# keep track of line numbers
alias action="LINE=\$LINENO; action"

echo "Creating large file (>4GB)..."
action dd if=/dev/zero of="$DATA" bs=1024 count=4200000 >/dev/null

echo "Encrypting file..."
action $CCRYPT -K testkey "$DATA"

echo "$NAME: test succeeded" >&2
cleanup
exit 0
