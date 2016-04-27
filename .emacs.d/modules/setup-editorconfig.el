(require 'editorconfig)

(let ((exe (locate-file "editorconfig" exec-path)))
  (if (not exe)
      (display-warning "editorconfig" "`editorconfig` not found on path.")
    (editorconfig-mode 1)))

(provide 'setup-editorconfig)
