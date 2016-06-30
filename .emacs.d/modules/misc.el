(require 'delimator)

(require 'ag)
(setq ag-arguments (append '("--hidden" "--ignore" ".git/") ag-arguments))

(provide 'misc)
