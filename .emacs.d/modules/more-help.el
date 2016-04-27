(require 'which-key)
(which-key-mode)
(global-set-key (kbd "C-h C-k") 'which-key-show-top-level)

(global-set-key (kbd "C-h C-m") 'discover-my-major)
(global-set-key (kbd "C-h M-m") 'discover-my-mode)

(provide 'more-help)
