(require 'ido-vertical-mode)
(require 'flx-ido)
(require 'projectile)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching 1
      ido-use-virtual-buffers t
      ido-use-faces nil)
(ido-vertical-mode 1)

(projectile-global-mode)

;; if a file is changed outside of Emacs, reload without asking
(global-auto-revert-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
