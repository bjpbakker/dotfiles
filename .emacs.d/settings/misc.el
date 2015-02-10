(require 'magit)
(add-hook 'magit-mode-hook (lambda () (evil-local-mode 0)))

(require 'ag)

(require 'dash-at-point)
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)
