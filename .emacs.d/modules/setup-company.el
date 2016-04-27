(require 'company)
(require 'company-flx)

(setq company-idle-delay nil
      company-tooltip-limit 10
      company-tooltip-flip-when-above t
      company-dabbrev-downcase nil
      company-dabbrev-ignore-case t)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook 'company-flx-mode)

(provide 'setup-company)
