(setq lisp-modes '(lisp-mode
                   emacs-lisp-mode
                   common-lisp-mode
                   scheme-mode
                   clojure-mode))

(defvar lisp-power-map (make-keymap))
(define-minor-mode lisp-power-mode "Fix keybindings; add power."
  :lighter " ⼒"
  :keymap lisp-power-map
  (setup 'eldoc
         (eldoc-mode))
  (setup 'paredit
         (paredit-mode t))
  (setup 'rainbow-delimiters
         (rainbow-delimiters-mode))
  (setup 'paren
         (show-paren-mode))
  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc))
  (lisp-key-bindings))
(define-key lisp-power-map [delete] 'paredit-forward-delete)
(define-key lisp-power-map [backspace] 'paredit-backward-delete)

(defun lisp-key-bindings ()
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "g.") 'find-function-at-point)))

(defun lisp/engage-lisp-power ()
  (lisp-power-mode t))

(dolist (mode lisp-modes)
  (add-hook (intern (format "%s-hook" mode))
            #'lisp/engage-lisp-power))

(setq inferior-lisp-program "clisp")
(setq scheme-program-name "racket")
