;;; flycheck-mode-line-marker.el --- Flycheck status marker in mode line

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

(require 'flycheck)

(define-minor-mode flycheck-mode-line-marker
  "Toggle marker symbols for the current Flycheck status in the mode line"
  :global t
  (progn
    (setq flycheck-mode-line '(:eval (flycheck-mode-line-marker--status-marker)))
    (force-mode-line-update t)))

(defun flycheck-mode-line-marker--status-marker (&optional status)
  (pcase (or status flycheck-last-status-change)
    (`finished (if flycheck-current-errors " ✗" " ✓"))
    (`running " ⌛")
    (`no-checker " ⁈")
    (`not-checked " ⁇")
    (`errored " ‼")
    (`interrupted " ⁉")
    (`suspicious " ❢")))

(provide 'flycheck-mode-line-marker)

;;; flycheck-mode-line-marker.el ends here
