(require 'company)
(require 'company-flx)

(setq company-idle-delay 0.2
      company-tooltip-align-annotations t)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'company-flx-mode)

(provide 'setup-company)
