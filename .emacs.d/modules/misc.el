(require 'delimator)

(require 'ag)
(setq ag-arguments (append '("--hidden" "--ignore" ".git/") ag-arguments))

(require 'dash-at-point)
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)

(provide 'misc)
