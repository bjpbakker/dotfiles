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

(provide 'config-util)
