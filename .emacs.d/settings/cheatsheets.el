(require 'cheatsheet)

(defun defsheet (group cheats-alist)
  (dolist (cheat cheats-alist)
    (let ((key (car cheat))
          (description (cdr cheat)))
      (cheatsheet-add :group group
                      :key key
                      :description description))))

(defsheet 'movement
  '(("C-n" . "down a line")
    ("C-p" . "up a line")))

(defsheet 'editing
  '(("C-k" . "kill line")
    ("C-S-backspace" . "kill while line (including line end)")
    ("C-o" . "new line above")))

(provide 'cheatsheets)
