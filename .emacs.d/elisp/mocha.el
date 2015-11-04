;;; mocha.el --- Mocha test runner

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

(defgroup :mocha nil
  "Run Mocha tests")

(defcustom mocha-extra-args ""
  "Extra command line arguments to pass to mocha")
(defcustom mocha-pwd-fn 'projectile-project-root
  "Function that gets the working dir of the mocha process")

(defun mocha-verify-file ()
  "Run all tests in the file associated with the current buffer"
  (interactive)
  (let* ((command (concat "mocha " mocha-extra-args " " (buffer-file-name)))
         (default-directory (funcall mocha-pwd-fn)))
    (compile command 'mocha-compilation-mode)))

(defun mocha-colorize-compilation-buffer ()
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region compilation-filter-start (point))))

(defun filter-non-sgr-control-sequences-apply-on-region (begin end)
  (save-excursion
    (goto-char begin)
    (while (re-search-forward "\033\\[\\??[0-9;]*[^0-9;m]" end t)
      (replace-match " "))))

(defun mocha-filter-non-sgr-control-sequences ()
  (let ((inhibit-read-only t))
    (filter-non-sgr-control-sequences-apply-on-region compilation-filter-start (point))))

(define-compilation-mode mocha-compilation-mode "Mocha"
  "Compilation mode for Mocha output."
  (add-hook 'compilation-filter-hook #'mocha-colorize-compilation-buffer nil t)
  (add-hook 'compilation-filter-hook #'mocha-filter-non-sgr-control-sequences nil t))

(provide 'mocha)

;;; mocha.el ends here