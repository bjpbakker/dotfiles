(require 'delimator)

(require 'ag)
(setq ag-arguments (append '("--hidden" "--ignore" ".git/") ag-arguments))
(with-eval-after-load 'evil
  (add-to-list 'evil-emacs-state-modes 'ag-mode))

(require 'dash-at-point)
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)

(provide 'misc)
