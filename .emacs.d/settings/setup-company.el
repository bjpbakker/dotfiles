(require 'company)
(require 'company-flx)

(setq company-idle-delay 0.2
      company-tooltip-limit 10
      company-tooltip-flip-when-above t)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'company-flx-mode)

(provide 'setup-company)
