(require 'evil)
(require 'evil-leader)

(defmacro bind (&rest commands)
  "Convenience macro to bind to interactive functions"
  `(lambda () (interactive) ,@commands))

(defmacro nmap (key action)
  "Maps key to action in normal state"
  `(define-key evil-normal-state-map ,key ,action))
(defmacro imap (key action)
  "Maps key to action in insert state"
  `(define-key evil-insert-state-map ,key ,action))
(defmacro vmap (key action)
  "Maps key to action in insert state"
  `(define-key evil-visual-state-map ,key ,action))

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
  "cd" 'cd
  "h" (bind (call-interactively 'help)))

(nmap (kbd "RET") 'save-buffer)
(nmap (kbd "C-b") 'evil-scroll-up)
(nmap (kbd "C-f") 'evil-scroll-down)
(nmap (kbd "Y") (kbd "y$"))

(nmap (kbd "C-h") 'evil-window-left)
(nmap (kbd "C-l") 'evil-window-right)
(nmap (kbd "C-k") 'evil-window-up)
(nmap (kbd "C-j") 'evil-window-down)

(global-set-key (kbd "C-u") (bind (kill-line 0)))
(nmap (kbd "C-u") (bind nil))
(vmap (kbd "C-u") (bind nil))

(global-set-key (kbd "s-0") 'text-scale-set)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-=") 'text-scale-increase)

(require 'magit)
(with-eval-after-load 'magit
  (global-set-key (kbd "C-x g") 'magit-status))

(require 'neotree)
(with-eval-after-load 'neotree
  (global-set-key [f8] 'neotree-toggle))
