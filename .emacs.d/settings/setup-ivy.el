(require 'ivy)

(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))
      ivy-initial-inputs-alist nil)

(global-set-key (kbd "M-x") 'counsel-M-x)

(set-face-attribute 'ivy-current-match nil
                    :background "#ffc911"
                    :foreground "#1c1c1c")

(with-eval-after-load 'projectile
  (setq projectile-completion-system 'ivy))

(ivy-mode)

(provide 'setup-ivy)
