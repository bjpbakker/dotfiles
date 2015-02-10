(require 'config-util)

(setup 'projectile
       (projectile-global-mode))

(setup 'flx-ido
       (ido-mode 1)
       (ido-everywhere 1)
       (flx-ido-mode 1)
       (setq ido-enable-flex-matching 1
             ido-use-virtual-buffers t
             ido-use-faces nil))

(setup 'ido-vertical-mode
       (ido-vertical-mode 1))

;; if a file is changed outside of Emacs, reload without asking
(global-auto-revert-mode t)

(setup 'uniquify
       (setq uniquify-buffer-name-style 'forward))

(require 'neotree)
