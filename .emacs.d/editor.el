(require 'rainbow-delimiters)

(defun setup-lisp ()
  (rainbow-delimiters-mode)
  (show-paren-mode))

(add-hook 'emacs-lisp-mode-hook 'setup-lisp)
(add-hook 'clojure-mode-hook 'setup-lisp)
(add-hook 'lisp-mode-hook 'setup-lisp)

(setq-default indent-tabs-mode nil)
