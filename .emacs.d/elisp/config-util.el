(defun always (value)
  `(lambda (&rest _) ,value))

(defmacro setup (module &rest commands)
  "Convenience macro to require module and run commands"
  `(require ,module)
  `(progn ,@commands))

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

(provide 'config-util)
