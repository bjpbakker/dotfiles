(require 'neotree)

(setq neo-vc-integration '(char)
      neo-theme 'arrow
      neo-mode-line-type 'none
      neo-smart-open t
      neo-dont-be-alone t)

;; change to the project root of the current buffer on show
(defun neo-change-to-project-root ()
  (neo-global--with-buffer
    (neo-buffer--change-root (projectile-project-root))))
(advice-add 'neotree-show :after #'neo-change-to-project-root)

(provide 'setup-neotree)
