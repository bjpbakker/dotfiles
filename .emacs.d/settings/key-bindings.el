(require 'which-key)
(which-key-setup-minibuffer)
(which-key-mode)

(define-key minibuffer-local-map (kbd "C-u") (bind (kill-line 0)))

(global-set-key (kbd "s-0") (bind (text-scale-adjust 0)))
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)

(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<C-return>") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(require 'avy)
(with-eval-after-load 'avy
  (global-set-key (kbd "C-:") 'avy-goto-char))

(with-eval-after-load 'etags-select
  (global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)
  (global-set-key (kbd "M-?") 'etags-select-find-tag))

(with-eval-after-load 'magit
  (global-set-key (kbd "C-x g") 'magit-status))

(with-eval-after-load 'ag
  (global-set-key (kbd "s-F") 'ag-project))

(with-eval-after-load 'neotree
  (global-set-key [f8] 'neotree-toggle))

(with-eval-after-load 'dash-at-point
  (global-set-key (kbd "C-c d") 'dash-at-point))

(with-eval-after-load 'delimator
  (global-set-key (kbd "C-c f d") 'delimator-delete-active-file))

(with-eval-after-load 'evil-leader
  (setq evil-leader/leader ",")
  (evil-leader/set-key
    "f" 'helm-projectile-find-file
    "b" 'switch-to-buffer
    "cd" 'helm-projectile-switch-project
    "h" (bind (call-interactively 'help))
    "." 'projectile-toggle-between-implementation-and-test))

(with-eval-after-load 'evil
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd " ") nil)
  (define-key evil-normal-state-map (kbd "RET") 'save-buffer)
  (define-key evil-normal-state-map (kbd "C-b") 'evil-scroll-page-up)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "C-f") 'evil-scroll-page-down)
  (define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "Y") (kbd "y$"))
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right))

(provide 'key-bindings)
