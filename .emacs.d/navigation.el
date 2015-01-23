(require 'ido-vertical-mode)
(require 'flx-ido)
(require 'projectile)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching 1)
(setq ido-use-faces nil)
(ido-vertical-mode 1)

(projectile-global-mode)
