(require 'paredit)

(defun paredit-non-lisp-key-map ()
  (let ((keymap (make-keymap)))
    (define-key keymap (kbd "C-)") 'paredit-forward-slurp-sexp)
    (define-key keymap (kbd "C-}") 'paredit-forward-barf-sexp)
    (define-key keymap (kbd "M-(") 'paredit-wrap-round)
    (define-key keymap (kbd "M-{") 'paredit-wrap-curly)
    (define-key keymap (kbd "M-)") 'paredit-close-round-and-newline)
    (define-key keymap (kbd "M-]") 'paredit-close-square-and-newline)
    (define-key keymap (kbd "M-}") 'paredit-close-curly-and-newline)
    (define-key keymap (kbd "M-\"") 'paredit-meta-doublequote)
    (define-key keymap (kbd "M-S") 'paredit-split-sexp)
    (define-key keymap (kbd "M-J") 'paredit-join-sexps)
    (define-key keymap (kbd "M-s") 'paredit-splice-sexp)
    (define-key keymap (kbd "M-r") 'paredit-raise-sexp)
    (define-key keymap (kbd "M-DEL") 'paredit-backward-kill-word)
    (define-key keymap (kbd "M-d") 'paredit-forward-kill-word)
    keymap))

(define-minor-mode paredit-non-lisp-mode "Paredit for non-lisp languages"
  :lighter "Paredit non-lisp"
  :keymap (paredit-non-lisp-key-map))

(provide 'paredit-non-lisp)
