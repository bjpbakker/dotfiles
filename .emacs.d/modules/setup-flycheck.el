(require 'flycheck)
(require 'flycheck-tip)
(require 'flycheck-mode-line-marker)

(setq flycheck-check-syntax-automatically '(save mode-enabled)
      flycheck-temp-prefix ".flycheck")

(set-face-attribute 'popup-tip-face nil :background "#58b1f3")

(defun setup-flycheck-mode ()
  (flycheck-tip-use-timer 'verbose)
  (flycheck-mode-line-marker))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'setup-flycheck-mode)

(provide 'setup-flycheck)
