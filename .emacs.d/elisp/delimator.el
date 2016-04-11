;;; delimator.el --- Work with files a bit more convenient

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

(defgroup delimator nil
  "Delimator"
  :group 'convenience)

;;;###autoload
(defun delimator-delete-buffer-file ()
  "Delete the file associated with the current buffer"
  (interactive)
  (let ((file (buffer-file-name)))
    (when file
      (if (vc-backend file)
          (vc-delete-file file)
        (progn
          (delete-file file)
          (message "Deleted file %s" file)
          (kill-buffer))))))

(provide 'delimator)

;;; delimator.el ends here
