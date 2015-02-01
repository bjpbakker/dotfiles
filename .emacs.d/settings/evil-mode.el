(require 'evil)
(require 'evil-leader)
(require 'evil-commentary)
(require 'evil-jumper)

(global-evil-leader-mode)
(evil-mode 1)

(setq evil-leader/leader ",")
(evil-leader/set-key
  "f" 'projectile-find-file
  "b" 'switch-to-buffer
  "cd" 'cd
  "h" (lambda () (interactive) (call-interactively 'help)))

(setq evil-jumper-auto-center t)
(global-evil-jumper-mode t)

(evil-commentary-mode)

; delete evil motion key bindings for RET and SPC. These keys are
; useless motion-wise and should be mapped in normal mode.
(defun delete-evil-motion-key! (key)
  "Delete key binding from evil motion keymap"
  (define-key evil-motion-state-map key nil))
(delete-evil-motion-key! (kbd "RET"))
(delete-evil-motion-key! (kbd " "))

(defun nmap (key action)
  (define-key evil-normal-state-map key action))

(nmap (kbd "RET") 'save-buffer)
(nmap (kbd "C-b") 'evil-scroll-up)
(nmap (kbd "C-f") 'evil-scroll-down)
(nmap (kbd "Y") (kbd "y$"))

(nmap (kbd "C-h") 'evil-window-left)
(nmap (kbd "C-l") 'evil-window-right)
(nmap (kbd "C-k") 'evil-window-up)
(nmap (kbd "C-j") 'evil-window-down)
