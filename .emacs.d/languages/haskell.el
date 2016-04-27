(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'haskell/customize)

(defun haskell/customize ()
  (turn-on-haskell-indent)
  (turn-on-haskell-doc)
  (turn-on-haskell-decl-scan)
  (setq haskell-tags-on-save t
        haskell-stylish-on-save t)

  (require 'haskell-interactive-mode)
  (require 'haskell-process)
  (setq haskell-process-type 'stack-ghci
        haskell-process-suggest-remove-import-lines t
        haskell-process-auto-import-loaded-modules t
        haskell-process-use-presentation-mode nil
        haskell-process-suggest-haskell-docs-imports t)
  (interactive-haskell-mode)

  (require 'flycheck-haskell-stack)
  (flycheck-haskell-stack-setup))
