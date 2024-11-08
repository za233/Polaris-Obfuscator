## Copyright (C) 2000-2018 Peter Selinger.
## This file is part of ccrypt. It is free software and it is covered
## by the GNU general public license. See the file COPYING for details.

## Process this file with automake to produce Makefile.in

EXTRA_DIST = ccrypt.1.in ccguess.1.in man2html.sed cypfaq01.txt

DISTCLEANFILES = ccrypt.ps ccrypt.html

man_MANS = ccrypt.1 ccguess.1
noinst_DATA = ccrypt.html

ps: ccrypt.ps ccguess.ps
html: ccrypt.html ccguess.html

SUFFIXES = .1 .ps .html

.1.ps:
	groff -man "$<" > "$@"

.1.html:
	cat "$<" | sed -f $(srcdir)/man2html.sed > "$@"

install-data-hook:
	test "@NAMECCRYPT@" = ccrypt || \
	mv -f $(DESTDIR)$(man1dir)/ccrypt.1 $(DESTDIR)$(man1dir)/@NAMECCRYPT@.1
	ln -f -s @NAMECCRYPT@.1 $(DESTDIR)$(man1dir)/@NAMEENCRYPT@.1
	ln -f -s @NAMECCRYPT@.1 $(DESTDIR)$(man1dir)/@NAMEDECRYPT@.1
	ln -f -s @NAMECCRYPT@.1 $(DESTDIR)$(man1dir)/@NAMECAT@.1

uninstall-local:
	rm -f $(DESTDIR)$(man1dir)/@NAMECCRYPT@.1
	rm -f $(DESTDIR)$(man1dir)/@NAMEENCRYPT@.1
	rm -f $(DESTDIR)$(man1dir)/@NAMEDECRYPT@.1
	rm -f $(DESTDIR)$(man1dir)/@NAMECAT@.1

