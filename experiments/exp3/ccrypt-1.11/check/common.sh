#! /bin/sh

# Copyright (C) 2000-2018 Peter Selinger.
# This file is part of ccrypt. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

# provide (dumb) replacements for missing functions

# first, because the "which" command on Solaris is totally useless,
# we need to implement our own. This code is adapted from autoconf.

my_which () {
    if test "$#" -ne 1; then
	echo "my_which: wrong number of arguments" >&2
	return 255
    fi
    cmd=$1
    IFS="${IFS=   }"; save_ifs="$IFS"; IFS=":"
    path="$PATH"
    for dir in $path; do
	test -z "$dir" && dir=.
	if test -f "$dir/$cmd"; then
	    echo "$dir/$cmd"
	    IFS="$save_ifs"
	    return 0
	fi
    done
    IFS="$save_ifs"
    return 1
}

# "mktemp" replacement: note that this creates the same filename each time. 
# Thus, when creating more than one tempfile, must give different templates.

# find a directory to use for temporary files.
case `uname -s | tr 'A-Z' 'a-z'` in
    os/2 )
	# in OS/2, shell redirection "< /tmp/xyz" is broken
	TMPDIR="."
	;;
    * )
	TMPDIR="${TEMPDIR:-/tmp}"
	;;
esac

# Note: we no longer use "which" to check whether mktemp is available;
# instead, we just try to run it. According to POSIX, /bin/sh must
# return 127 if a command is missing, but not all shells are
# compliant. We therefore check the returned filename. mktemp is
# supposed to create the file, but if it doesn't, we err on the side
# of caution.
FILE=`mktemp "$TMPDIR/ccrypt-common-1.XXXXXX" 2>/dev/null`
if test $? = 127 || test ! -f "$FILE"; then
    echo "Warning: mktemp is missing or not working. Using a dummy replacement." >&2
    mktemp () {
	echo "$1" | sed -e "s/XXXXXX/$$/"
    }
else
    rm -f "$FILE"
fi
