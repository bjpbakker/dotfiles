(setq lisp-modes '(lisp-mode
                   emacs-lisp-mode
                   common-lisp-mode
                   scheme-mode
                   clojure-mode))

(defvar lisp-power-map (make-keymap))
(define-minor-mode lisp-power-mode "Add power to Lisp modes"
  :lighter " ⼒"
  :keymap lisp-power-map

  (require 'eldoc)
  (eldoc-mode)

  (require 'paredit)
  (paredit-mode t)

  (require 'rainbow-delimiters)
  (rainbow-delimiters-mode)

  (require 'paren)
  (show-paren-mode)

  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc)))

(define-key lisp-power-map [delete] 'paredit-forward-delete)
(define-key lisp-power-map [backspace] 'paredit-backward-delete)

(defun lisp/engage-lisp-power ()
  (lisp-power-mode t))

(dolist (mode lisp-modes)
  (add-hook (intern (format "%s-hook" mode))
            #'lisp/engage-lisp-power))

(setq inferior-lisp-program "clisp")
(setq scheme-program-name "racket")
