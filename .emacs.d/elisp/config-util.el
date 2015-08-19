(defun always (value)
  `(lambda (&rest _) ,value))

(defmacro setup (module &rest commands)
  "Convenience macro to require module and run commands"
  (declare (indent defun))
  `(progn
     (require ,module)
     ,@commands))

(defmacro bind (&rest commands)
  "Convenience macro to bind to interactive functions"
  `(lambda () (interactive) ,@commands))

(defmacro define-evil-normal-key (key action)
  "Define `key` to do `action` in evil normal state."
  `(define-key evil-normal-state-map ,key ,action))

(provide 'config-util)
