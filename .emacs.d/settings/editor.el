(require 'config-util)

(setq-default indent-tabs-mode nil)

(setup 'company
       (add-hook 'after-init-hook 'global-company-mode)
       (setq company-idle-delay 0.2))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'avy)
