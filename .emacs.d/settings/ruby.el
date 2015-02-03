(require 'ruby-mode)

(with-eval-after-load 'ruby-mode
  (require 'ruby-electric)
  (add-hook 'ruby-mode-hook 'ruby-electric-mode))
