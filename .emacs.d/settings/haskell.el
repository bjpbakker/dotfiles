(require 'config-util)

(setup 'haskell-mode
       (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
       (setup 'haskell-interactive-mode
              (require 'haskell-process)
              (custom-set-variables
               '(haskell-process-suggest-remove-import t)
               '(haskell-process-auto-import-loaded-modules))
              (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
              (add-hook 'haskell-mode-hook 'haskell/customize)))

(setup 'flycheck-haskell
       '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

(defun haskell/customize ()
  (setup 'fill-column-indicator
         (setq fci-rule-column 79)
         (fci-mode)))
