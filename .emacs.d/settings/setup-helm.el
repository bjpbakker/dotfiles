(require 'helm)
(require 'helm-config)
(require 'helm-flx)

(setq helm-quick-update t
      helm-idle-delay 0.0
      helm-ff-skip-boring-files t
      helm-autoresize-max-height 40)

(helm-mode)
(helm-autoresize-mode)
(helm-flx-mode)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(provide 'setup-helm)
