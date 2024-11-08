;;; ps-ccrypt.el --- reading/writing/loading encrypted files

;; Copyright (C) 1993, 1994, 1995, 1997  Free Software Foundation, Inc.
;; Copyright (C) 2001-2018 Peter Selinger

;; Author: jka@ece.cmu.edu (Jay K. Adams) (jka-compr.el)
;; Changes: selinger@users.sourceforge.net (Peter Selinger) (ps-ccrypt.el)
;; Maintainer: Peter Selinger
;; Keywords: data

;; This is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This software is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this software; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary: 

;; This package implements low-level support for reading, writing, and
;; loading encrypted files.  It hooks into the low-level file I/O
;; functions (including write-region and insert-file-contents) so that
;; they automatically encrypt or decrypt a file if the file appears to
;; need it (based on the extension of the file name).  Packages like
;; Rmail, VM, GNUS, and Info should be able to work with encrypted
;; files without modification.

;;; Commentary on ccrypt support:

;; support for encryption/decryption with ccrypt was added by Peter
;; Selinger.  We have to deal with prompting users for passwords,
;; remembering passwords for each buffer, etc.

;; limitations:

;; On some systems, passing the password to ccrypt in an environment
;; variable may not be safe; this happens if users are able to display the
;; environment of processes they don't own with the 'ps' program. I don't
;; know of any system where this is still the case, but I heard that they
;; may exist. In any case, ccrypt deletes the value from its environment as
;; soon as it has been read; so this should not be a problem in most
;; situations.

;; Sometimes emacs will choke if it wants to auto-save a buffer in the
;; absense of a password or a minibuffer for prompting for it. I have not
;; yet figured out how to handle this situation; however, it does not arise
;; during "normal" operation because when a buffer's name has the ".cpt"
;; extension, a password is normally always defined for that buffer.

;; Under certain circumstances, decrypted data will be written to disk
;; temporarily. For instance, during each encryption operation, the
;; decrypted data is written to a temporary file. This is because the
;; call-process built-in function is designed to read from a file and write
;; to a buffer, not the other way around. I don't know a way around this
;; problem at the moment. Another potential way in which decrypted data
;; might appear on disk is if buffer contents are swapped out from main
;; memory.

;; auto-save files should not be a problem, since such files are also
;; encrypted if the buffer's filename indicates that they should be so.

;;; todo:

;; fix bug where "sh" does not return proper return value.
;; add support for .gz.cpt and .gzc
;; prompt for password twice when opening a new file.

;; CHANGES:
;;

;; 2018/07/25: PS1 - Emacs 26 compatibility: fixed a bug caused by an
;; incompatible change in write-region.
;;
;; 2017/03/05: PS1 - handle variable rename
;; (inhibit-first-line-modes-suffixes -> inhibit-local-variables-suffixes)
;; in a backward compatible way.
;;
;; 2017/02/22: PS1 - fixed warnings: inhibit-first-line-modes-suffixes
;; -> inhibit-local-variables-suffixes, fix buffer-file-type warning.
;;
;; 2016/11/13: PS1 - delete KEY earlier (even on password mismatch).
;;
;; 2016/11/13: PS1 - move (setenv "KEY") into the unwind-protect.
;; Note: this still leaks the password if the user mistyped it.
;;
;; 2016/11/13: PS1 - delete password from environment after each use.
;;
;; 2010/12/28: PS1 - only display "Password does not match" message if
;; password was just entered by the user; if the non-matching password
;; is stored, just prompt for it without error.
;;
;; 2010/12/28: PS1 - moved "encrypting xx" and "decrypting xx"
;; messages inside ps-ccrypt-call-process; this ensures the message
;; will appear even after a mismatched password prompt.
;;
;; 2010/12/28: PS1 - when inserting a file in a buffer, use filename,
;; not buffer name, in password prompt.
;;
;; 2010/12/28: PS1 - use existing buffer password when re-reading a
;; file.
;;
;; 2010/11/10: PS1 - fix mapcar compiler warnings.
;;
;; 2008/02/04: PS1 - better error message if ccrypt command not found.
;;
;; 2006/08/11: PS1 - removed compression functionality, renamed
;; package as ps-ccrypt. This can now coexist peacefully with
;; jka-compr.
;;
;; 2003/08/25: PS1 - bugfix
;;
;; 2003/08/13: JR1 - provide jka-compr existence functions in
;; jka-compr-ccrypt.el, to keep info.el happy.
;;
;; 2001/10/27: PS1 - pass keyword to ccrypt in environment variable,
;; not on command line. Renamed package as jka-compr-ccrypt.

;; INSTRUCTIONS:
;;
;; To use ps-ccrypt, simply load this package, and edit as usual.
;; One way to do this automatically is to include the lines
;;  (setq load-path (cons "<path>" load-path))
;;  (require 'ps-ccrypt "ps-ccrypt.el")
;; in your .emacs file, where <path> is the pathname where this file 
;; is found.
;;
;; The operation of this package should be transparent to the user
;; (except for messages appearing when a file is being encrypted or
;; decrypted).
;;
;; The variable, ps-ccrypt-encryption-info-list can be used to
;; customize ps-ccrypt to work with other encryption programs.
;; The default value of this variable allows ps-ccrypt to work with
;; ccrypt.
;;
;; If you don't want messages about encryption to show up in the echo
;; area, you can set the encrypt-name and deencrypt-name fields of
;; the ps-ccrypt-encryption-info-list to nil.
;;
;; The password for a buffer can be changed with the interactive command
;; M-x ccrypt-set-buffer-password. Note that the change does not affect
;; anything until the next time the buffer is saved.

;; ACKNOWLEDGMENTS
;;
;; ps-ccrypt is an adaptation of jka-compr, which is part of GNU Emacs.
;;
;; jka-compr is a V19 adaptation of jka-compr for V18 of Emacs.  Many people
;; have made helpful suggestions, reported bugs, and even fixed bugs in 
;; jka-compr.  I recall the following people as being particularly helpful.
;;
;;   Jean-loup Gailly
;;   David Hughes
;;   Richard Pieri
;;   Daniel Quinlan
;;   Chris P. Ross
;;   Rick Sladkey
;;
;; Andy Norman's ange-ftp was the inspiration for the original jka-compr for
;; Version 18 of Emacs.
;;
;; After I had made progress on the original jka-compr for V18, I learned of a
;; package written by Kazushi Jam Marukawa, called jam-zcat, that did exactly
;; what I was trying to do.  I looked over the jam-zcat source code and
;; probably got some ideas from it.
;;


;;; Code:

;; disable compiler warning about use of a "free variable"
(defvar buffer-file-type)

;; inhibit-first-line-modes-suffixes was renamed to
;; inhibit-local-variables-suffixes in Emacs 24.1. Ensure backward
;; compatibility with older versions.
(if (not (boundp 'inhibit-local-variables-suffixes))
    (defvaralias 'inhibit-local-variables-suffixes 'inhibit-first-line-modes-suffixes))

(defgroup encryption nil
  "Data encryption utilities"
  :group 'data)

(defgroup ps-ccrypt nil
  "ps-ccrypt customization"
  :group 'encryption)


(defcustom ps-ccrypt-shell "sh"
  "*Shell to be used for calling encryption programs. This is only used to
discard part of the output when a file is partially decrypted.  Note:
the hard-coded syntax in ps-ccrypt more or less assumes that this is
either sh or bash. See also the function ps-ccrypt-shell-escape."
  :type 'string
  :group 'ps-ccrypt)

(defun ps-ccrypt-shell-escape (x)
  "Takes a string and returns its escaped form to be used on the
command line of the shell whose name is set in ps-ccrypt-shell."
  (concat "\"" 
	  (apply 'concat 
		 (mapcar (function 
			  (lambda (c)
			    (if (memq c '(?\" ?\\ ?\$))
				(list ?\\ c)
			      (char-to-string c))))
			 x)) 
	  "\""))


;;; I have this defined so that .cpt files are assumed to be in ccrypt
;;; format.
(defcustom ps-ccrypt-encryption-info-list
  ;;[regexp
  ;; encr-message encr-prog encr-args
  ;; decr-message decr-prog decr-args
  ;; can-append auto-mode-flag retval-list password-flag]
  '(["\\.cpt\\(\\#\\|~\\|\\.~[0-9]+~\\)?\\'"
     "encrypting"     ("ccrypt" "-q" "-E" "KEY")
     "decrypting"     ("ccrypt" "-q" "-d" "-E" "KEY")
     nil t (0) t])

  "List of vectors that describe available encryption and encryption
techniques.  Each element, which describes an encryption or encryption
technique, is a vector of the form [REGEXP ENCRYPT-MSG ENCRYPT-COMMAND
DECRYPT-MSG DECRYPT-COMMAND APPEND-FLAG AUTO-MODE-FLAG RETVAL-LIST
PASSWORD-FLAG], where:

   regexp                is a regexp that matches filenames that are
                         encrypted with this format

   encrypt-msg          is the message to issue to the user when doing this
                         type of encryption (nil means no message)

   encrypt-command      is a command that performs this encryption, that
                         is, a list consisting of a program name and arguments

   decrypt-msg        is the message to issue to the user when doing this
                         type of decryption (nil means no message)

   decrypt-command    is a command that performs this encryption, that
                         is, a list consisting of a program name and arguments

   append-flag           is non-nil if this encryption technique can be
                         appended

   auto-mode-flag        non-nil means strip the regexp from file names
                         before attempting to set the mode

   retval-list           list of acceptable return values for encrypt
                         and decrypt program

   password-flag         non-nil if we are dealing with encryption rather
                         than encryption. In this case, the password is
                         passed to the ccrypt command in the environment 
                         variable KEY."

  :type '(repeat (vector regexp
			 (choice :tag "Encrypt Message"
				 (string :format "%v")
				 (const :tag "No Message" nil))
			 (repeat :tag "Encrypt Command" string)
			 (choice :tag "Decrypt Message"
				 (string :format "%v")
				 (const :tag "No Message" nil))
			 (repeat :tag "Decrypt Command" string)
			 (boolean :tag "Append")
			 (boolean :tag "Auto Mode")
                         (repeat :tag "Acceptable Return Values" integer)
                         (boolean :tag "Password Mode")))
  :group 'ps-ccrypt)

(defvar ps-ccrypt-mode-alist-additions
  (list (cons "\\.tgz\\'" 'tar-mode))
  "A list of pairs to add to `auto-mode-alist' when ps-ccrypt is installed.")

;; List of all the elements we actually added to file-coding-system-alist.
(defvar ps-ccrypt-added-to-file-coding-system-alist nil)

(defvar ps-ccrypt-file-name-handler-entry
  nil
  "The entry in `file-name-handler-alist' used by the ps-ccrypt I/O functions.")

;;; Functions for accessing the return value of ps-ccrypt-get-encryption-info
(defun ps-ccrypt-info-regexp               (info)  (aref info 0))
(defun ps-ccrypt-info-encrypt-message     (info)  (aref info 1))
(defun ps-ccrypt-info-encrypt-command     (info)  (aref info 2))
(defun ps-ccrypt-info-decrypt-message   (info)  (aref info 3))
(defun ps-ccrypt-info-decrypt-command   (info)  (aref info 4))
(defun ps-ccrypt-info-can-append           (info)  (aref info 5))
(defun ps-ccrypt-info-strip-extension      (info)  (aref info 6))
(defun ps-ccrypt-info-retval-list          (info)  (aref info 7))
(defun ps-ccrypt-info-password-flag        (info)  (aref info 8))

(defun ps-ccrypt-get-encryption-info (filename)
  "Return information about the encryption scheme of FILENAME.
The determination as to which encryption scheme, if any, to use is
based on the filename itself and `ps-ccrypt-encryption-info-list'."
  (catch 'encryption-info
    (let ((case-fold-search nil))
      (mapc
       (function (lambda (x)
		   (and (string-match (ps-ccrypt-info-regexp x) filename)
			(throw 'encryption-info x))))
       ps-ccrypt-encryption-info-list)
      nil)))

(defun ps-ccrypt-substitute (list key value)
  "Replace key by value in list"
  (mapcar (function (lambda (x) 
		      (if (eq x key)
			  value
			x)))
	  list))

(defvar ps-ccrypt-buffer-password nil
  "The encryption password. This variable is buffer-local.")

(make-variable-buffer-local 'ps-ccrypt-buffer-password)
(put 'ps-ccrypt-buffer-password 'permanent-local t)

(defun ps-ccrypt-read-passwd (&optional confirm filename)
  (read-passwd (format "Password for %s: " (or filename (buffer-name))) confirm nil))

(defun ps-ccrypt-get-buffer-password (&optional buffer)
  "Get encryption password for BUFFER (default: current buffer). 
Return nil if not set."
  (with-current-buffer (or buffer (current-buffer))
    ps-ccrypt-buffer-password))

(defun ps-ccrypt-set-buffer-password (password &optional buffer)
  "Set the encryption password for BUFFER (default: current buffer)."
  (with-current-buffer (or buffer (current-buffer))
    (setq ps-ccrypt-buffer-password password)))

(defun ccrypt-set-buffer-password ()
  "Set the encryption password for current buffer."
  (interactive "")
  (setq ps-ccrypt-buffer-password 
	(ps-ccrypt-read-passwd t)))

(put 'encryption-error 'error-conditions '(encryption-error file-error error))

;(defvar ps-ccrypt-acceptable-retval-list '(0 2 141))

(defun ps-ccrypt-error (command infile message &optional errfile)

  (let ((errbuf (get-buffer-create " *ps-ccrypt-error*"))
	(curbuf (current-buffer)))
    (with-current-buffer errbuf
      (widen) (erase-buffer)
      (insert (format "Error while executing \"%s < %s\"\n\n"
		      (mapconcat 'identity command " ")
		      infile))
      
      (and errfile
	   (insert-file-contents errfile)))
     (display-buffer errbuf))

  (signal 'encryption-error
	  (list "Opening input file" (format "error %s" message) infile)))

(defvar ps-ccrypt-dd-program
  "/bin/dd")

(defvar ps-ccrypt-dd-blocksize 256)

(defun ps-ccrypt-partial-decrypt (command message infile beg
					     len retvals &optional password)
  "Call program PROG with ARGS args taking input from INFILE.
Fourth and fifth args, BEG and LEN, specify which part of the output
to keep: LEN chars starting BEG chars from the beginning.
Sixth arg, RETVALS, specifies acceptable return values.
Seventh arg, &optional PASSWORD, specifies encryption password, if any."
  (let* ((skip (/ beg ps-ccrypt-dd-blocksize))
	 (prefix (- beg (* skip ps-ccrypt-dd-blocksize)))
	 (count (and len (1+ (/ (+ len prefix) ps-ccrypt-dd-blocksize))))
	 (start (point))
	 (dd (format "%s bs=%d skip=%d %s 2> /dev/null"
		     ps-ccrypt-dd-program
		     ps-ccrypt-dd-blocksize
		     skip
		     ;; dd seems to be unreliable about
		     ;; providing the last block.  So, always
		     ;; read one more than you think you need.
		     (if count (concat "count=" (1+ count)) "")))
	 (pipe-command (append command (list "|" dd))))
    
    (setq password (ps-ccrypt-call-process pipe-command
						  ps-ccrypt-shell 
						  message infile t retvals 
						  password))

    ;; Delete the stuff after what we want, if there is any.
    (and
     len
     (< (+ start prefix len) (point))
     (delete-region (+ start prefix len) (point)))

    ;; Delete the stuff before what we want.
    (delete-region start (+ start prefix)))
  password)

(defun ps-ccrypt-call-process2 (command infile buffer display &optional shell)
  "Similar to call-process. If SHELL is given and non-nil, then execute
the given command in the given shell. COMMAND in this case is a list
of strings, which are concatenated (with spaces) before execution.
Redirections, pipelines, etc, are permissible. If SHELL is absent or
nil, then execute the command directly, without a shell. In this case,
command must be a list of a program name, followed by individual
command line arguments."
  
  (if shell
      (call-process shell infile buffer display 
		    "-c" (mapconcat 'identity command " "))
    (apply 'call-process (car command) infile buffer display (cdr command)))
  )

;; pw-fresh is non-nil if the password was recently supplied by the user.
(defun ps-ccrypt-call-process (command shell message infile output retvals &optional password pw-fresh)

  (let ((filename (expand-file-name infile))
        (err-file (ps-ccrypt-make-temp-name))
	(coding-system-for-read (or coding-system-for-read 'undecided))
	(coding-system-for-write 'no-conversion)
	(buffer output)
	done)
    
    (unwind-protect

        (while (not done)
	  (message (format "%s..." message))
	  (if password
	      (setenv "KEY" password))
	  (let*
	      ((status
		(if shell
		    (call-process shell infile (list buffer err-file) nil 
				  "-c" (mapconcat 'identity command " "))
		  (condition-case err
		      (apply 'call-process (car command) infile 
			     (list buffer err-file) nil (cdr command))
		    (file-error 
		     (if (equal (nth 1 err) "Searching for program") 
			 ;; if command not found, output special error
			 (error "Failed to run %s: %s" (nth 3 err) (nth 2 err)) (sit-for 1)
		       ;; pass on other errors (e.g. input file not found)
		       (signal (car err) (cdr err))))))))

            ;; do not leave the password in the enviroment.
            (setenv "KEY")
	    (cond ((and password (eq status 4))
		   (cond (pw-fresh
			  (message "Password does not match; please try again")
			  (sit-for 1)))
		   (setq password (ps-ccrypt-read-passwd nil filename))
		   (setq pw-fresh t))
		  ((not (memq status retvals))
		   (ps-ccrypt-error command
				    infile message err-file))
		  (t
		   (setq done t)
		   (message (format "%s...done" message))))))
	  
      (ps-ccrypt-delete-temp-file err-file)
      (setenv "KEY"))

    password))
 

;;; Support for temp files.  Much of this was inspired if not lifted
;;; from ange-ftp.

(defcustom ps-ccrypt-temp-name-template
  (expand-file-name "jka-com" temporary-file-directory)
  "Prefix added to all temp files created by ps-ccrypt.
There should be no more than seven characters after the final `/'."
  :type 'string
  :group 'ps-ccrypt)

(defvar ps-ccrypt-temp-name-table (make-vector 31 nil))

(defun ps-ccrypt-make-temp-name (&optional local-copy)
  "This routine will return the name of a new file."
  (let* ((lastchar ?a)
	 (prevchar ?a)
	 (template (concat ps-ccrypt-temp-name-template "aa"))
	 (lastpos (1- (length template)))
	 (not-done t)
	 file
	 entry)

    (while not-done
      (aset template lastpos lastchar)
      (setq file (concat (make-temp-name template) "#"))
      (setq entry (intern file ps-ccrypt-temp-name-table))
      (if (or (get entry 'active)
	      (file-exists-p file))

	  (progn
	    (setq lastchar (1+ lastchar))
	    (if (> lastchar ?z)
		(progn
		  (setq prevchar (1+ prevchar))
		  (setq lastchar ?a)
		  (if (> prevchar ?z)
		      (error "Can't allocate temp file.")
		    (aset template (1- lastpos) prevchar)))))

	(put entry 'active (not local-copy))
	(setq not-done nil)))

    file))


(defun ps-ccrypt-delete-temp-file (temp)

  (put (intern temp ps-ccrypt-temp-name-table)
       'active nil)

  (condition-case ()
      (delete-file temp)
    (error nil)))


(defun ps-ccrypt-write-region (start end file &optional append visit lockname mustbenew)
  (let* ((filename (expand-file-name file))
	 (visit-file (if (stringp visit) (expand-file-name visit) filename))
	 (lock-file (if (stringp lockname) (expand-file-name lockname) nil))
	 (info (ps-ccrypt-get-encryption-info visit-file)))
      
      (if info

	  (let ((can-append (ps-ccrypt-info-can-append info))
		(encrypt-message (ps-ccrypt-info-encrypt-message info))
		(encrypt-command (ps-ccrypt-info-encrypt-command info))
		(password (if (ps-ccrypt-info-password-flag info) 
			      (or (ps-ccrypt-get-buffer-password) 
				  (ps-ccrypt-read-passwd t filename))
			    nil))
		(retvals (ps-ccrypt-info-retval-list info))
		(base-name (file-name-nondirectory visit-file))
		temp-file temp-buffer
		;; we need to leave `last-coding-system-used' set to its
		;; value after calling write-region the first time, so
		;; that `basic-save-buffer' sees the right value.
		(coding-system-used last-coding-system-used))

	    (setq temp-buffer (get-buffer-create " *ps-ccrypt-wr-temp*"))
	    (with-current-buffer temp-buffer
	      (widen) (erase-buffer))

	    (if (and append
		     (not can-append)
		     (file-exists-p filename))
		
		(let* ((local-copy (file-local-copy filename))
		       (local-file (or local-copy filename)))
		  
		  (setq temp-file local-file))

	      (setq temp-file (ps-ccrypt-make-temp-name)))

	    (ps-ccrypt-run-real-handler 'write-region
					(list start end temp-file t 'dont))
	    ;; save value used by the real write-region
	    (setq coding-system-used last-coding-system-used)

	    ;; Here we must read the output of encrypt program as is
	    ;; without any code conversion.
	    (let ((coding-system-for-read 'no-conversion))
	      (setq password 
		    (ps-ccrypt-call-process encrypt-command
					    nil
					    (concat encrypt-message
						    " " base-name)
					    temp-file
					    temp-buffer
					    retvals
					    password)))

	    (with-current-buffer temp-buffer
              (let ((coding-system-for-write 'no-conversion))
                (if (memq system-type '(ms-dos windows-nt))
                    (setq buffer-file-type t) )
                (ps-ccrypt-run-real-handler 'write-region
                                            (list (point-min) (point-max)
                                                  filename
                                                  (and append can-append) 'dont lock-file mustbenew))
                (erase-buffer)) )

	    (ps-ccrypt-delete-temp-file temp-file)

	    (cond
	     ((eq visit t)
	      (setq buffer-file-name filename)
	      (ps-ccrypt-set-buffer-password password)
	      (set-visited-file-modtime))
	     ((stringp visit)
	      (setq buffer-file-name visit)
	      (ps-ccrypt-set-buffer-password password)
	      (let ((buffer-file-name filename))
		(set-visited-file-modtime))))

	    (and (or (eq visit t)
		     (eq visit nil)
		     (stringp visit))
		 (message "Wrote %s" visit-file))

	    ;; ensure `last-coding-system-used' has an appropriate value
	    (setq last-coding-system-used coding-system-used)

	    nil)
	      
	(ps-ccrypt-run-real-handler 'write-region
				    (list start end filename append visit lock-file mustbenew)))))


(defun ps-ccrypt-insert-file-contents (file &optional visit beg end replace)
  (barf-if-buffer-read-only)

  (and (or beg end)
       visit
       (error "Attempt to visit less than an entire file"))

  (let* ((filename (expand-file-name file))
	 (info (ps-ccrypt-get-encryption-info filename)))

    (if info

	(let* ((pw-fresh nil)
	       (decrypt-message (ps-ccrypt-info-decrypt-message info))
	       (decrypt-command (ps-ccrypt-info-decrypt-command info))
	       (password (if (ps-ccrypt-info-password-flag info) 
			     (or (ps-ccrypt-get-buffer-password) 
				 (progn (setq pw-fresh t) 
					(ps-ccrypt-read-passwd nil filename))) 
			   nil))
	       (retvals (ps-ccrypt-info-retval-list info))
	       (base-name (file-name-nondirectory filename))
	       (notfound nil)
	       (local-copy
		(ps-ccrypt-run-real-handler 'file-local-copy (list filename)))
	       local-file
	       size start
	       (coding-system-for-read
		(or coding-system-for-read
		    ;; If multibyte characters are disabled,
		    ;; don't do that conversion.
		    (and (null enable-multibyte-characters)
			 (or (auto-coding-alist-lookup
			      (ps-ccrypt-byte-compiler-base-file-name file))
			     'raw-text))
		    (let ((coding (find-operation-coding-system
				   'insert-file-contents
				   (ps-ccrypt-byte-compiler-base-file-name file))))
		      (and (consp coding) (car coding)))
		    'undecided)) )
	  
	  (setq local-file (or local-copy filename))
	  
	  (if visit
	      (setq buffer-file-name filename))

	  (unwind-protect		; to make sure local-copy gets deleted

	      (progn
		  
		(condition-case error-code

		    (progn
		      (if replace
			  (goto-char (point-min)))
		      (setq start (point))
		      (if (or beg end)
			  (ps-ccrypt-partial-decrypt 
			   decrypt-command
			   (concat decrypt-message
				   " " base-name)
			   local-file
			   (or beg 0)
			   (if (and beg end)
			       (- end beg)
			     end)
			   retvals
			   password)
			;; If visiting, bind off buffer-file-name so that
			;; file-locking will not ask whether we should
			;; really edit the buffer.
			(let ((buffer-file-name
			       (if visit nil buffer-file-name)))
			  (setq password
				(ps-ccrypt-call-process 
				 decrypt-command
				 nil
				 (concat decrypt-message
					 " " base-name)
				 local-file
				 t
				 retvals
				 password
				 pw-fresh))))
		      (setq size (- (point) start))
		      (if replace
			  (let* ((del-beg (point))
				 (del-end (+ del-beg size)))
			    (delete-region del-beg
					   (min del-end (point-max)))))
		      (goto-char start))
		  (error
		   (if (and (eq (car error-code) 'file-error)
			    (eq (nth 3 error-code) local-file))
		       (if visit
			   (setq notfound error-code)
			 (signal 'file-error 
				 (cons "Opening input file"
				       (nthcdr 2 error-code))))
		     (signal (car error-code) (cdr error-code))))))

	    (and
	     local-copy
	     (file-exists-p local-copy)
	     (delete-file local-copy)))

	  (and
	   visit
	   (progn
	     (unlock-buffer)
	     (setq buffer-file-name filename)
	     (set-visited-file-modtime)))

	  (and visit
	     (ps-ccrypt-set-buffer-password password))
	    
	  (and
	   visit
	   notfound
	   (signal 'file-error
		   (cons "Opening input file" (nth 2 notfound))))

	  ;; This is done in insert-file-contents after we return.
	  ;; That is a little weird, but better to go along with it now
	  ;; than to change it now.

;;;	  ;; Run the functions that insert-file-contents would.
;;; 	  (let ((p after-insert-file-functions)
;;; 		(insval size))
;;; 	    (while p
;;; 	      (setq insval (funcall (car p) size))
;;; 	      (if insval
;;; 		  (progn
;;; 		    (or (integerp insval)
;;; 			(signal 'wrong-type-argument
;;; 				(list 'integerp insval)))
;;; 		    (setq size insval)))
;;; 	      (setq p (cdr p))))

	  (list filename size))

      (ps-ccrypt-run-real-handler 'insert-file-contents
				  (list file visit beg end replace)))))


(defun ps-ccrypt-file-local-copy (file)
  (let* ((filename (expand-file-name file))
	 (info (ps-ccrypt-get-encryption-info filename)))

    (if info

	(let* ((pw-fresh nil)
	       (decrypt-message (ps-ccrypt-info-decrypt-message info))
	       (decrypt-command (ps-ccrypt-info-decrypt-command info))
	       (password (if (ps-ccrypt-info-password-flag info) 
			     (or (ps-ccrypt-get-buffer-password) 
				 (progn (setq pw-fresh t)
					(ps-ccrypt-read-passwd nil filename)))
			   nil))
	       (retvals (ps-ccrypt-info-retval-list info))
	       (base-name (file-name-nondirectory filename))
	       (local-copy
		(ps-ccrypt-run-real-handler 'file-local-copy (list filename)))
	       (temp-file (ps-ccrypt-make-temp-name t))
	       (temp-buffer (get-buffer-create " *ps-ccrypt-flc-temp*"))
	       (notfound nil)
	       local-file)
	  
	  (setq local-file (or local-copy filename))

	  (unwind-protect

	      (with-current-buffer temp-buffer
		  
		;; Here we must read the output of decrypt program
		;; and write it to TEMP-FILE without any code
		;; conversion.  An appropriate code conversion (if
		;; necessary) is done by the later I/O operation
		;; (e.g. load).
		(let ((coding-system-for-read 'no-conversion)
		      (coding-system-for-write 'no-conversion))

		  (ps-ccrypt-call-process 
		   decrypt-command
		   nil
		   (concat decrypt-message
			   " " base-name)
		   local-file
		   t
		   retvals
		   password
		   pw-fresh)

		  (write-region
		   (point-min) (point-max) temp-file nil 'dont)))

	    (and
	     local-copy
	     (file-exists-p local-copy)
	     (delete-file local-copy))

	    (kill-buffer temp-buffer))

	  temp-file)
	    
      (ps-ccrypt-run-real-handler 'file-local-copy (list filename)))))


;;; Support for loading encrypted files.
(defun ps-ccrypt-load (file &optional noerror nomessage nosuffix)
  "Documented as original."

  (let* ((local-copy (ps-ccrypt-file-local-copy file))
	 (load-file (or local-copy file)))

    (unwind-protect

	(let (inhibit-file-name-operation
	      inhibit-file-name-handlers)
	  (or nomessage
	      (message "Loading %s..." file))

	  (let ((load-force-doc-strings t))
	    (load load-file noerror t t))

	  (or nomessage
	      (message "Loading %s...done." file)))

      (ps-ccrypt-delete-temp-file local-copy))

    t))

(defun ps-ccrypt-byte-compiler-base-file-name (file)
  (let ((info (ps-ccrypt-get-encryption-info file)))
    (if (and info (ps-ccrypt-info-strip-extension info))
	(save-match-data
	  (substring file 0 (string-match (ps-ccrypt-info-regexp info) file)))
      file)))

(put 'write-region 'ps-ccrypt 'ps-ccrypt-write-region)
(put 'insert-file-contents 'ps-ccrypt 'ps-ccrypt-insert-file-contents)
(put 'file-local-copy 'ps-ccrypt 'ps-ccrypt-file-local-copy)
(put 'load 'ps-ccrypt 'ps-ccrypt-load)
(put 'byte-compiler-base-file-name 'ps-ccrypt
     'ps-ccrypt-byte-compiler-base-file-name)

(defvar ps-ccrypt-inhibit nil
  "Non-nil means inhibit automatic decryption temporarily.
Lisp programs can bind this to t to do that.
It is not recommended to set this variable permanently to anything but nil.")

(defun ps-ccrypt-handler (operation &rest args)
  (save-match-data
    (let ((jka-op (get operation 'ps-ccrypt)))
      (if (and jka-op (not ps-ccrypt-inhibit))
	  (apply jka-op args)
	(ps-ccrypt-run-real-handler operation args)))))

;; If we are given an operation that we don't handle,
;; call the Emacs primitive for that operation,
;; and manipulate the inhibit variables
;; to prevent the primitive from calling our handler again.
(defun ps-ccrypt-run-real-handler (operation args)
  (let ((inhibit-file-name-handlers
	 (cons 'ps-ccrypt-handler
	       (and (eq inhibit-file-name-operation operation)
		    inhibit-file-name-handlers)))
	(inhibit-file-name-operation operation))
    (apply operation args)))

;;;###autoload(defun auto-encryption-mode (&optional arg)
;;;###autoload  "\
;;;###autoloadToggle automatic file encryption and decryption.
;;;###autoloadWith prefix argument ARG, turn auto encryption on if positive, else off.
;;;###autoloadReturns the new status of auto encryption (non-nil means on)."
;;;###autoload  (interactive "P")
;;;###autoload  (if (not (fboundp 'ps-ccrypt-installed-p))
;;;###autoload      (progn
;;;###autoload        (require 'ps-ccrypt)
;;;###autoload        ;; That turned the mode on, so make it initially off.
;;;###autoload        (toggle-auto-encryption)))
;;;###autoload  (toggle-auto-encryption arg t))

(defun toggle-auto-encryption (&optional arg message)
  "Toggle automatic file encryption and decryption.
With prefix argument ARG, turn auto encryption on if positive, else off.
Returns the new status of auto encryption (non-nil means on).
If the argument MESSAGE is non-nil, it means to print a message
saying whether the mode is now on or off."
  (interactive "P\np")
  (let* ((installed (ps-ccrypt-installed-p))
	 (flag (if (null arg)
		   (not installed)
		 (or (eq arg t) (listp arg) (and (integerp arg) (> arg 0))))))

    (cond
     ((and flag installed) t)		; already installed

     ((and (not flag) (not installed)) nil) ; already not installed

     (flag
      (ps-ccrypt-install))

     (t
      (ps-ccrypt-uninstall)))


    (and message
	 (if flag
	     (message "Automatic file (de)encryption is now ON.")
	   (message "Automatic file (de)encryption is now OFF.")))

    flag))

(defun ps-ccrypt-build-file-regexp ()
  (concat
   "\\("
   (mapconcat
    'ps-ccrypt-info-regexp
    ps-ccrypt-encryption-info-list
    "\\)\\|\\(")
   "\\)"))


(defun ps-ccrypt-install ()
  "Install ps-ccrypt.
This adds entries to `file-name-handler-alist' and `auto-mode-alist'
and `inhibit-local-variables-suffixes'."

  (setq ps-ccrypt-file-name-handler-entry
	(cons (ps-ccrypt-build-file-regexp) 'ps-ccrypt-handler))

  (setq file-name-handler-alist (cons ps-ccrypt-file-name-handler-entry
				      file-name-handler-alist))

  (setq ps-ccrypt-added-to-file-coding-system-alist nil)

  (mapc
   (function (lambda (x)
	       ;; Don't do multibyte encoding on the encrypted files.
	       (let ((elt (cons (ps-ccrypt-info-regexp x)
				 '(no-conversion . no-conversion))))
		 (setq file-coding-system-alist
		       (cons elt file-coding-system-alist))
		 (setq ps-ccrypt-added-to-file-coding-system-alist
		       (cons elt ps-ccrypt-added-to-file-coding-system-alist)))

	       (and (ps-ccrypt-info-strip-extension x)
		    ;; Make entries in auto-mode-alist so that modes
		    ;; are chosen right according to the file names
		    ;; sans `.gz'.
		    (setq auto-mode-alist
			  (cons (list (ps-ccrypt-info-regexp x)
				      nil 'ps-ccrypt)
				auto-mode-alist))
		    ;; Also add these regexps to
		    ;; inhibit-local-variables-suffixes, so that a
		    ;; -*- line in the first file of a encrypted tar
		    ;; file doesn't override tar-mode.
		    (setq inhibit-local-variables-suffixes
			  (cons (ps-ccrypt-info-regexp x)
				inhibit-local-variables-suffixes)))))
   ps-ccrypt-encryption-info-list)
  (setq auto-mode-alist
	(append auto-mode-alist ps-ccrypt-mode-alist-additions)))


(defun ps-ccrypt-uninstall ()
  "Uninstall ps-ccrypt.
This removes the entries in `file-name-handler-alist' and `auto-mode-alist'
and `inhibit-local-variables-suffixes' that were added
by `ps-ccrypt-installed'."
  ;; Delete from inhibit-local-variables-suffixes
  ;; what ps-ccrypt-install added.
  (mapc
     (function (lambda (x)
		 (and (ps-ccrypt-info-strip-extension x)
		      (setq inhibit-local-variables-suffixes
			    (delete (ps-ccrypt-info-regexp x)
				    inhibit-local-variables-suffixes)))))
     ps-ccrypt-encryption-info-list)

  (let* ((fnha (cons nil file-name-handler-alist))
	 (last fnha))

    (while (cdr last)
      (if (eq (cdr (car (cdr last))) 'ps-ccrypt-handler)
	  (setcdr last (cdr (cdr last)))
	(setq last (cdr last))))

    (setq file-name-handler-alist (cdr fnha)))

  (let* ((ama (cons nil auto-mode-alist))
	 (last ama)
	 entry)

    (while (cdr last)
      (setq entry (car (cdr last)))
      (if (or (member entry ps-ccrypt-mode-alist-additions)
	      (and (consp (cdr entry))
		   (eq (nth 2 entry) 'ps-ccrypt)))
	  (setcdr last (cdr (cdr last)))
	(setq last (cdr last))))
    
    (setq auto-mode-alist (cdr ama)))

  (let* ((ama (cons nil file-coding-system-alist))
	 (last ama)
	 entry)

    (while (cdr last)
      (setq entry (car (cdr last)))
      (if (member entry ps-ccrypt-added-to-file-coding-system-alist)
	  (setcdr last (cdr (cdr last)))
	(setq last (cdr last))))
    
    (setq file-coding-system-alist (cdr ama))))

      
(defun ps-ccrypt-installed-p ()
  "Return non-nil if ps-ccrypt is installed.
The return value is the entry in `file-name-handler-alist' for ps-ccrypt."

  (let ((fnha file-name-handler-alist)
	(installed nil))

    (while (and fnha (not installed))
     (and (eq (cdr (car fnha)) 'ps-ccrypt-handler)
	   (setq installed (car fnha)))
      (setq fnha (cdr fnha)))

    installed))

;;; Add the file I/O hook if it does not already exist.
;;; Make sure that ps-ccrypt-file-name-handler-entry is eq to the
;;; entry for ps-ccrypt in file-name-handler-alist.
(and (ps-ccrypt-installed-p)
     (ps-ccrypt-uninstall))

(ps-ccrypt-install)


(provide 'ps-ccrypt)

;; ps-ccrypt.el ends here.
