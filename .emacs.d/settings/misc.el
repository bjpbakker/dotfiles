(require 'config-util)

(setup 'magit
       (custom-set-variables
        '(magit-push-always-verify nil))
       (add-hook 'magit-mode-hook (lambda () (evil-local-mode 0))))

(setup 'ag
       (setq ag-arguments (append '("--hidden" "--ignore" ".git/") ag-arguments)))

(setup 'dash-at-point
       (autoload 'dash-at-point "dash-at-point"
         "Search the word at point with Dash." t nil))
