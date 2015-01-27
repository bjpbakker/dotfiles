(require 'rainbow-delimiters)
(require 'autopair)

(defun setup-lisp ()
  (rainbow-delimiters-mode)
  (show-paren-mode)
  (enable-paredit-mode))

(add-hook 'emacs-lisp-mode-hook 'setup-lisp)
(add-hook 'clojure-mode-hook 'setup-lisp)
(add-hook 'lisp-mode-hook 'setup-lisp)
