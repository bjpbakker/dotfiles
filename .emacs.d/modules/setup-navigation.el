(global-subword-mode t)

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character (indentation), or to
beginning of line when point is at indentation."
  (interactive "^")
  (let ((pos (point)))
    (back-to-indentation)
    (and (= pos (point))
         (beginning-of-line))))
(global-set-key (kbd "C-a") 'smart-beginning-of-line)
(global-set-key (kbd "<home>") 'smart-beginning-of-line)

;; rebind 'scroll-left and 'scroll-right keys to navigate the buffer ring
(global-set-key (kbd "C-x <") 'previous-buffer)
(global-set-key (kbd "C-x >") 'next-buffer)

(require 'ace-window)
(defun vsplit-last-buffer (prefix)
  "Split window vertically and display the next buffer"
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
      (switch-to-next-buffer)))

(defun hsplit-last-buffer (prefix)
  "Split window horizontally and display the next buffer"
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1)
      (switch-to-next-buffer)))

(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x 2") 'vsplit-last-buffer)
(global-set-key (kbd "C-x 3") 'hsplit-last-buffer)

(provide 'setup-navigation)
