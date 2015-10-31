(require 'projectile)
(projectile-global-mode)

(with-eval-after-load 'helm
  (require 'helm-projectile)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(provide 'setup-projectile)
