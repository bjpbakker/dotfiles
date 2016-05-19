;;; flycheck-javascript-flow.el --- Flycheck Javascript syntax checker using Flow

;; Copyright © 2015-2016 Bart Bakker <bart@thesoftwarecraft.com>

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

(require 'flycheck)
(require 'json)

(defun flycheck-javascript-flow--extract-descr (err)
  (let ((msgs (cdr (assoc 'message err))))
    (mapconcat (lambda (x) (cdr (assoc 'descr x))) (cdr msgs) " ")))

(defun flycheck-javascript-flow-parse-errors (output checker buffer)
  (let ((json-array-type 'list))
    (let ((o (json-read-from-string output)))
      (mapcar (lambda (err)
                (let ((cause (cadr (assoc 'message err))))
                  (flycheck-error-new
                   :line (cdr (assoc 'line cause))
                   :column (cdr (assoc 'start cause))
                   :level 'error
                   :message (flycheck-javascript-flow--extract-descr err)
                   :filename (file-relative-name
                              (cdr (assoc 'path cause))
                              (file-name-directory (file-truename
                                                    (buffer-file-name))))
                   :buffer buffer
                   :checker checker)))
              (cdr (assoc 'errors o))))))

(flycheck-define-checker javascript-flow
  "A JavaScript syntax checker using Flow. See URL `http://flowtype.org/'."
  :command ("flow" "--json" source-original)
  :error-parser flycheck-javascript-flow-parse-errors
  :modes (js-mode js2-mode web-mode)
  :next-checkers (javascript-eslint))

(provide 'flycheck-javascript-flow)

;;; flycheck-javascript-flow.el ends here
