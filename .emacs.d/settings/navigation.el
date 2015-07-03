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

(setup 'neotree
       (add-hook 'neotree-mode-hook
                 (lambda ()
                   (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
                   (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
                   (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
                   (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

       (with-eval-after-load 'evil
         (add-to-list 'evil-emacs-state-modes 'neotree-mode)))
