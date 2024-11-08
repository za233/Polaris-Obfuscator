# Copyright (C) 2000-2018 Peter Selinger.
# This file is part of ccrypt. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

s/^\.TH \([^ ]*\) \([^ ]*\) "\([^"]*\)" .*$/<html><body bgcolor=#ffffff><title>Man page for \1(\2)<\/title><h1>Man page for \1(\2)<\/h1>/
s/^\.SH \(.*\)$/<h3>\1<\/h3>/
s/^\.nf/<pre>/
s/^\.fi/<\/pre><p>/
s/^\.TP \([0-9]*\)/<dl><dt>__sed_gaga__/
s/^\.TP$/<p><dt>__sed_gaga__/
/__sed_gaga__/N
s/^\.PD$/<\/dl>/
s/^\.IP$/<table border=0><tr><td width=30><\/td><td>/
s/^\.LP$/<\/td><\/tr><\/table>/
s/^\.B \(.*\)$/<b>\1<\/b>/
s/__sed_gaga__\n\.B \(.*\)$/<b>\1<\/b><dd>/
s/__sed_gaga__/<!oops>/
s/^\.I \(.*\)$/<i>\1<\/i>/
s/^\.\\" \(.*\)/<!--\1-->/
s/^$/<p>/
s/\\-/-/g
s/\\fI\([^\\]*\)\\fP/<i>\1<\/i>/g
s/\\fB\([^\\]*\)\\fP/<b>\1<\/b>/g

