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

(provide 'setup-window-movement)
