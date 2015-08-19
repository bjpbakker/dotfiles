(require 'config-util)

(setup 'deft
       (add-hook 'deft-mode-hook (lambda () (evil-local-mode 0)))
       (setq deft-directory "~/Dropbox/deft")
       (setq deft-use-filename-as-title t)
       (setq deft-extension "org")
       (setq deft-text-mode 'org-mode)
       (with-eval-after-load 'evil
         (add-to-list 'evil-emacs-state-modes 'deft-mode)))
