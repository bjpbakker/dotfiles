;;; fonts.el --- Fonts support

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

(defgroup fonts nil
  "Manage fonts."
  :group 'convenience)

(defcustom fonts-screen-preset-alist '()
  "Associative list that links screen preset name to a font"
  :group 'fonts)

(defun fonts-load-screen-preset (preset)
  (interactive (list (completing-read "Screen preset: "
                                      (mapcar #'car fonts-screen-preset-alist))))
  (let ((font (assoc preset fonts-screen-preset-alist)))
    (set-face-attribute 'default nil :font (cdr font))
    (set-frame-font (cdr font) nil t)))


(provide 'fonts)

;;; fonts.el ends here
