(require 'config-util)

(require 'flycheck)
(require 'flycheck-mode-line-marker)

(defun setup-flycheck-mode ()
  (flycheck-mode-line-marker)
  (setq flycheck-check-syntax-automatically '(save)))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'setup-flycheck-mode)

(provide 'setup-flycheck)
