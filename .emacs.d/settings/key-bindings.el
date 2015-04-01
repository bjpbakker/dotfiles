(require 'config-util)
(require 'evil)
(require 'evil-leader)

; delete evil motion key bindings for RET and SPC. These keys are
; useless motion-wise and should be mapped in normal mode.
(defun delete-evil-motion-key! (key)
  "Delete key binding from evil motion keymap"
  (define-key evil-motion-state-map key nil))
(delete-evil-motion-key! (kbd "RET"))
(delete-evil-motion-key! (kbd " "))

(setq evil-leader/leader ",")
(evil-leader/set-key
  "f" 'projectile-find-file
  "b" 'switch-to-buffer
  "cd" 'projectile-switch-project
  "h" (bind (call-interactively 'help))
  "." 'projectile-toggle-between-implementation-and-test)

(define-evil-normal-key (kbd "RET") 'save-buffer)
(define-evil-normal-key (kbd "C-b") 'evil-scroll-page-up)
(define-evil-normal-key (kbd "C-u") 'evil-scroll-up)
(define-evil-normal-key (kbd "C-f") 'evil-scroll-page-down)
(define-evil-normal-key (kbd "C-d") 'evil-scroll-down)
(define-evil-normal-key (kbd "Y") (kbd "y$"))

(define-evil-normal-key (kbd "C-h") 'evil-window-left)
(define-evil-normal-key (kbd "C-j") 'evil-window-down)
(define-evil-normal-key (kbd "C-k") 'evil-window-up)
(define-evil-normal-key (kbd "C-l") 'evil-window-right)

(define-key minibuffer-local-map (kbd "C-u") (bind (kill-line 0)))

(global-set-key (kbd "s-0") (bind (text-scale-adjust 0)))
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-=") 'text-scale-increase)

(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<C-return>") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

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
