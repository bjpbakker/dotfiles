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

(nmap (kbd "RET") 'save-buffer)
(nmap (kbd "C-b") 'evil-scroll-up)
(nmap (kbd "C-f") 'evil-scroll-down)
(nmap (kbd "Y") (kbd "y$"))

(define-key evil-motion-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") 'evil-window-right)

(global-set-key (kbd "C-u") (bind (kill-line 0)))
(nmap (kbd "C-u") (bind nil))
(vmap (kbd "C-u") (bind nil))

(global-set-key (kbd "s-0") (bind (text-scale-adjust 0)))
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-=") 'text-scale-increase)

(with-eval-after-load 'magit
  (global-set-key (kbd "C-x g") 'magit-status))

(with-eval-after-load 'ag
  (global-set-key (kbd "s-F") 'ag-project))

(with-eval-after-load 'neotree
  (global-set-key [f8] 'neotree-toggle))

(with-eval-after-load 'dash-at-point
  (global-set-key (kbd "C-c d") 'dash-at-point))
