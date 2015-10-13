(require 'config-util)

(setup 'rust-mode
  (add-hook 'rust-mode-hook 'rust/customize))

(defun rust/customize ()
  (setup 'racer
    (setq racer-rust-src-path "/Users/bart/src/rust/src"
          racer-cmd "/Users/bart/bin/racer")
    (racer-activate))
  (setup 'flycheck-rust
    (flycheck-rust-setup))
  (setup 'rainbow-delimiters
    (rainbow-delimiters-mode)))

(defun rust/generate-tags ()
  (interactive)
  (let ((cwd default-directory))
    (progn
      (cd (projectile-project-root))
      (call-process "rusty-tags" nil nil nil "emacs")
      (setq tags-file-name "rusty-tags.emacs")
      (setq tags-table-list (list (concat default-directory "rusty-tags.emacs")))
      (cd cwd))))
