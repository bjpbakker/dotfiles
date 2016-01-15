(require 'evil)
(require 'evil-leader)
(require 'evil-jumper)
(require 'evil-commentary)

(setq evil-jumper-auto-center t)

(defun setup-evil-mode ()
  (evil-esc-to-quit)
  (global-evil-leader-mode)
  (global-evil-jumper-mode)
  (evil-commentary-mode))

(defun evil-esc-to-quit ()
  ;; make Esc quit pretty much anything
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit))

(add-hook 'evil-mode-hook #'setup-evil-mode)
(add-to-list 'evil-emacs-state-modes #'text-mode)
(evil-mode)

(require 'evil-paredit)
(add-hook 'paredit-mode-hook #'evil-paredit-mode)
(add-hook 'paredit-non-lisp-mode-hook #'evil-paredit-mode)

(provide 'setup-evil)
