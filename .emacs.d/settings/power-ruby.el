(require 'config-util)
(require 'ruby-mode)

(defvar ruby-power-map (make-keymap))
(define-minor-mode ruby-power-mode "Add power to Ruby"
  :lighter " (power)"
  :keymap ruby-power-map
  (setup 'rspec-mode
         (setq rspec-use-rake-when-possible nil
               rspec-use-opts-file-when-available nil
               compilation-scroll-output t)
         (advice-add 'rspec-compile :around #'run-with-bash-shell))
  (setup 'projectile-rails
         (projectile-rails-on)
         (advice-add 'projectile-rails-generate :around #'run-with-bash-shell))
  (setup 'inf-ruby
         (inf-ruby-minor-mode t)
         (inf-ruby-switch-setup))
  (setup 'bundler
         (advice-add 'bundle-command :around #'run-with-bash-shell))
  (setup 'electric
         (electric-pair-mode))
  (setup 'ruby-end
         (ruby-end-mode))
  (setup 'ruby-refactor
         (ruby-refactor-mode))
  (setup 'ruby-tools
         (ruby-tools-mode))
  (setup 'paredit-non-lisp
         (paredit-non-lisp-mode))
  (setup 'rainbow-delimiters
         (rainbow-delimiters-mode))
  (setup 'fill-column-indicator
         (fci-mode))
  (setup 'rbenv
         (setq rbenv-show-active-ruby-in-modeline nil))
  (ruby-key-bindings))

(defun ruby-console ()
  (interactive)
  (cl-letf (((symbol-function 'completing-read) (always "test")))
    (inf-ruby-console-auto)))

(defun ruby-key-bindings ()
  (with-eval-after-load 'evil
    (define-evil-normal-key (kbd "gf") 'projectile-rails-goto-file-at-point)
    (define-evil-normal-key (kbd "g.") 'find-tag))
  (with-eval-after-load 'evil-leader
    (evil-leader/set-key
      "." 'goto-spec-or-target
      "T" 'rspec-verify-single
      "t" 'rspec-verify
      "r" 'rspec-rerun))
  (define-key ruby-power-map (kbd "C-c C-z") 'ruby-console)
  (define-key ruby-power-map (kbd "C-c M-j") 'ruby-jack-in))

(defun goto-spec-or-target ()
  (interactive)
  (or (rspec-find-spec-or-target-other-window)
      (projectile-rails-find-current-spec)))

(defun ruby-jack-in ()
  (interactive)
  (save-excursion
    (let ((conf (current-window-configuration)))
      (ruby-console)
      (set-process-query-on-exit-flag (inf-ruby-proc) nil)
      (robe-start)
      (set-window-configuration conf))))

(defun ruby-jack-out ()
  (interactive)
  (progn
    (let* ((ruby-buffer (get-buffer inf-ruby-buffer))
           (process (get-buffer-process ruby-buffer)))
      (when process
        (delete-process process))
      (when (buffer-live-p ruby-buffer)
        (kill-buffer ruby-buffer)))
    (setq robe-running nil)))

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
