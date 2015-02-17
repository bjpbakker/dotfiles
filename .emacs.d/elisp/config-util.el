(defun always (value)
  `(lambda (&rest _) ,value))

(defmacro setup (module &rest commands)
  "Convenience macro to require module and run commands"
  `(progn
     (require ,module)
     ,@commands))

(defmacro bind (&rest commands)
  "Convenience macro to bind to interactive functions"
  `(lambda () (interactive) ,@commands))

(defmacro define-evil-motion (key action)
  "Define an evil motion for `key` to do `action`."
  `(define-key evil-motion-state-map ,key ,action))
(defmacro define-evil-visual-motion (key action)
  "Define an evil motion `key` to do `action` in visual state."
  `(define-key evil-visual-state-map ,key ,action))

(provide 'config-util)
