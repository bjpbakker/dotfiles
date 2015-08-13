;;; ctags.el --- Exuberant ctags support

;; Copyright © 2015 Bart Bakker <bart@thesoftwarecraft.com>

;; Author Bart Bakker <bart@thesoftwarecraft.com>

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defgroup ctags nil
  "Exuberant ctags"
  :group 'tools)

(defcustom ctags-executable "ctags"
  "Name of the `ctags' executable"
  :group 'ctags
  :type '(file :must-match t))

(defcustom ctags-program-options '("-R")
  "List with options to pass to the ctags program"
  :group 'ctags
  :type 'list)

(defcustom ctags-languages '("all")
  "The languages for which to enable tag generation."
  :group 'ctags
  :type 'list)

(defcustom ctags-lang-kinds-alist '()
  "Associative list of ctags language kinds."
  :group 'ctags
  :type 'alist)

(defcustom ctags-excludes '(".git" "log" "tmp")
  "A list with files excluded from indexing"
  :group 'ctags
  :type 'list)

(defcustom ctags-extra-files-function nil
  "A function to provide extra files to index"
  :group 'ctags
  :type 'function)

(defcustom ctags-tagfile "TAGS"
  "Name of the generated tags file"
  :group 'ctags
  :type 'string)

(defcustom ctags-project-root-function 'projectile-project-root
  "A function used to get the project root"
  :group 'ctags
  :type 'function)

(defcustom ctags-tagfile-function 'ctags-tagfile-in-project-root
  "A function used to get the location of the tagfile.

This function is called with the project root and the tagfile name."
  :group 'ctags
  :type 'function)

(defun ctags-generate-tags (rebuild)
  (interactive "P")
  "Generate a TAGS file.

By default tags are appended to an existing tag file. With a prefix argument the
tags file is fully rebuild."
  (let ((args (ctags--build-process-args rebuild))
        (max-minibuffer-height-savepoint max-mini-window-height))
    (progn
      (message "Generating tags for %s .." (ctags--root-dir))
      (setq max-mini-window-height 1)
      (apply #'call-process ctags-executable nil nil nil args)
      (setq max-mini-window-height max-minibuffer-height-savepoint)
      (message "%s file was generated" ctags-tagfile))))

(defun ctags--build-process-args (rebuild)
  (delete-dups (append
                (ctags--tagfile)
                (ctags--append-flag rebuild)
                ctags-program-options
                (ctags--excludes)
                (ctags--languages)
                (ctags--lang-kinds)
                (list (ctags--root-dir))
                (ctags--extra-files))))

(defun ctags--root-dir ()
  (file-name-as-directory (funcall ctags-project-root-function)))

(defun ctags-tagfile-in-project-root (project-root tagfile-name)
  (concat project-root tagfile-name))

(defun ctags--tagfile ()
  (list "-f" (funcall ctags-tagfile-function (ctags--root-dir) ctags-tagfile)))

(defun ctags--append-flag (rebuild)
  (list "-e" (concat "--append=" (if rebuild "no" "yes"))))

(defun ctags--extra-files ()
  (if ctags-extra-files-function
      (funcall ctags-extra-files-function)
    nil))

(defun ctags--excludes ()
  (mapcar (lambda (x) (concat "--exclude=" x)) ctags-excludes))

(defun ctags--languages ()
  (list (concat "--languages="
                (mapconcat #'identity ctags-languages ","))))

(defun ctags--lang-kinds ()
  (mapcar (lambda (x) (format "--%s-kinds=%s" (car x) (cdr x)))
          ctags-lang-kinds-alist))

(provide 'ctags)

;;; ctags.el ends here
