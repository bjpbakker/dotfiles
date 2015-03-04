(require 'config-util)
(require 'ruby-mode)

(defvar ruby-power-map (make-keymap))
(define-minor-mode ruby-power-mode "Add power to Ruby"
  :lighter " (power)"
  :keymap ruby-power-map
  (setup 'rspec-mode
         (setq rspec-use-rake-when-possible nil
               compilation-scroll-output t
               compilation-exit-message-function 'auto-close-rspec-compilation-buffer))
  (setup 'projectile-rails
         (projectile-rails-on))
  (setup 'inf-ruby
         (inf-ruby-minor-mode t)
         (inf-ruby-switch-setup))
  (setup 'robe
         (robe-mode)
         (push 'company-robe company-backends))
  (setup 'electric
         (electric-pair-mode))
  (setup 'ruby-end
         (ruby-end-mode))
  (setup 'ruby-refactor
         (ruby-refactor-mode))
  (setup 'paredit-non-lisp
         (paredit-non-lisp-mode))
  (setup 'rainbow-delimiters
         (rainbow-delimiters-mode))
  (setup 'fill-column-indicator
         fci-rule-column 80
         (fci-mode))
  (ruby-key-bindings))

(defun ruby-console ()
  (interactive)
  (cl-letf (((symbol-function 'completing-read) (always "test")))
    (inf-ruby-console-auto)))

(defun ruby-key-bindings ()
  (with-eval-after-load 'evil
    (define-evil-normal-key (kbd "gf") 'projectile-rails-goto-file-at-point)
    (define-evil-normal-key (kbd "g.") 'robe-jump))
  (with-eval-after-load 'evil-leader
    (evil-leader/set-key
      "." 'goto-spec-or-target
      "T" 'rspec-verify-single
      "t" 'rspec-verify
      "r" 'rspec-rerun))
  (define-key ruby-power-map (kbd "C-c C-z") 'ruby-console))

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

(defun auto-close-rspec-compilation-buffer (status code msg)
  (when (and (eq status 'exit) (zerop code))
    (bury-buffer)
    (replace-buffer-in-windows))
  (cons msg code))

(defun ruby/engage-power ()
  (ruby-power-mode t))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'ruby/engage-power)
  (setq ruby-insert-encoding-magic-comment nil))
