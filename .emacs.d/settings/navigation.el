(require 'config-util)

(setup 'helm
  (require 'helm-config)
  (helm-mode 1)
  (setup 'helm-flx
    (helm-flx-mode +1)))

(setup 'projectile
  (projectile-global-mode))
(setup 'helm-projectile
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(setup 'ido
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-use-virtual-buffers t
        ido-use-faces nil)
  (ido-mode +1))
(setup 'flx-ido
  (flx-ido-mode +1))
(setup 'ido-vertical-mode
  (ido-vertical-mode 1))

;; if a file is changed outside of Emacs, reload without asking
(global-auto-revert-mode t)

(setup 'uniquify
  (setq uniquify-buffer-name-style 'forward))

(setup 'neotree
  (defun neo-change-to-project-root ()
    (neo-global--with-buffer
      (neo-buffer--change-root (projectile-project-root))))
  (setq neo-vc-integration '(char)
        neo-theme 'arrow
        neo-mode-line-type 'none
        neo-smart-open t
        neo-dont-be-alone t)
  (advice-add 'neotree-show :after #'neo-change-to-project-root)

  (with-eval-after-load 'evil
    (add-to-list 'evil-emacs-state-modes #'neotree-mode)))
