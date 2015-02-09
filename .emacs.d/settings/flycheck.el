(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'customize-flycheck)

(defun customize-flycheck ()
  (setq flycheck-check-syntax-automatically '(save))
  (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
