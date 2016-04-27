(require 'rust-mode)
(add-hook 'rust-mode-hook #'rust/customize)

(require 'racer)
(setq racer-rust-src-path "/Users/bart/src/rust/src"
      racer-cmd "/Users/bart/bin/racer")
(add-hook 'racer-mode-hook #'eldoc-mode)

(defun rust/customize ()
  (racer-mode)
  (require 'flycheck-rust)
  (flycheck-rust-setup)
  (require 'rainbow-delimiters)
  (rainbow-delimiters-mode))

(defun rust/generate-tags ()
  (interactive)
  (let ((cwd default-directory))
    (progn
      (cd (projectile-project-root))
      (call-process "rusty-tags" nil nil nil "emacs")
      (setq tags-file-name "rusty-tags.emacs")
      (setq tags-table-list (list (concat default-directory "rusty-tags.emacs")))
      (cd cwd))))
