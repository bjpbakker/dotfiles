(require 'config-util)

(setup 'flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setup 'flycheck-mode-line-marker
    (add-hook 'flycheck-mode-hook #'flycheck-mode-line-marker))
  (add-hook 'flycheck-mode-hook #'customize-flycheck))

(defun customize-flycheck ()
  (setq flycheck-check-syntax-automatically '(save)
        flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
