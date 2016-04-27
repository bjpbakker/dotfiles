(require 'ruby-mode)

(defvar ruby-power-map (make-keymap))
(define-minor-mode ruby-power-mode "Add power to Ruby"
  :lighter " ⼒"
  :keymap ruby-power-map

  (require 'rspec-mode)
  (setq rspec-use-rake-when-possible nil
        rspec-use-opts-file-when-available nil
        compilation-scroll-output t)
  (advice-add 'rspec-compile :around #'run-with-bash-shell)

  (require 'projectile-rails)
  (projectile-rails-on)
  (advice-add 'projectile-rails-generate :around #'run-with-bash-shell)

  (require 'inf-ruby)
  (inf-ruby-minor-mode t)
  (inf-ruby-switch-setup)

  (require 'bundler)
  (advice-add 'bundle-command :around #'run-with-bash-shell)
  (advice-add 'bundle-list-gems :around #'run-with-bash-shell)
  (advice-add 'bundle-list-gem-paths :around #'run-with-bash-shell)

  (require 'ctags)
  (setq ctags-languages '("ruby")
        ctags-extra-files-function 'bundle-list-gem-paths)
  (add-to-list 'ctags-lang-kinds-alist '(ruby . "fF"))
  (add-to-list 'ctags-excludes "db")

  (require 'electric)
  (electric-pair-mode)

  (require 'ruby-end)
  (ruby-end-mode)

  (require 'ruby-refactor)
  (ruby-refactor-mode)

  (require 'paredit-non-lisp)
  (paredit-non-lisp-mode)

  (require 'rainbow-delimiters)
  (rainbow-delimiters-mode)

  (require 'rbenv))

(defun always (value)
  `(lambda (&rest _) ,value))

(defun ruby-console ()
  (interactive)
  (cl-letf (((symbol-function 'completing-read) (always "test")))
    (inf-ruby-console-auto)))

(defun bundle-list-gem-paths ()
  (save-excursion
    (let* ((cmd "bundle list --paths")
           (bundle-out (shell-command-to-string cmd)))
      (split-string bundle-out "\n"))))

(defun goto-spec-or-target ()
  (interactive)
  (or (rspec-find-spec-or-target-other-window)
      (projectile-rails-find-current-spec)))

(defun run-with-bash-shell (fn &rest args)
  "Run fn with shell set to bash"
  (let ((shell-file-name "/bin/bash"))
    (apply fn args)))

(defun ruby/engage-power ()
  (ruby-power-mode t))

(with-eval-after-load 'ruby-mode
  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-hook 'ruby-mode-hook #'ruby/engage-power)
  (setq ruby-insert-encoding-magic-comment nil))
