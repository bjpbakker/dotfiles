(require 'config-util)

(setup 'evil-leader
       (global-evil-leader-mode))

(setup 'evil-commentary
       (evil-commentary-mode))

(setup 'evil-jumper
       (setq evil-jumper-auto-center t)
       (global-evil-jumper-mode t))

(setup 'evil-paredit
       (add-hook 'paredit-mode-hook #'evil-paredit-mode)
       (add-hook 'paredit-non-lisp-mode-hook #'evil-paredit-mode))

(defun evil-esc-to-quit ()
  ;; make Esc quit pretty much anything
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
  (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit))

(setup 'evil
       (evil-mode 1)
       (evil-esc-to-quit))
