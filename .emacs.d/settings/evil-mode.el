(require 'evil)
(require 'evil-leader)
(require 'evil-commentary)

(global-evil-leader-mode)
(evil-mode 1)

(setq evil-leader/leader ",")
(evil-leader/set-key
  "f" 'projectile-find-file
  "b" 'switch-to-buffer)

(evil-commentary-default-setup)

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
