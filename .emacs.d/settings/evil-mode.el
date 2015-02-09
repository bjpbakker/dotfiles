(require 'evil)
(require 'evil-leader)
(require 'evil-commentary)
(require 'evil-jumper)
(require 'evil-paredit)

(global-evil-leader-mode)
(evil-mode 1)

(setq evil-jumper-auto-center t)
(global-evil-jumper-mode t)

(evil-commentary-mode)

(add-hook 'paredit-mode-hook #'evil-paredit-mode)

;; make Esc quit pretty much anything
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

;; use hjkl bindings in some emacs modes
(evil-add-hjkl-bindings magit-status-mode-map 'emacs)
