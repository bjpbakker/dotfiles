(require 'ruby-mode)

(defmacro setup (module &rest commands)
  "Convenience macro to require module and run commands"
  `(require ,module)
  `(progn ,@commands))

(defvar ruby-power-map (make-keymap))
(define-minor-mode ruby-power-mode "Add power to Ruby"
  :lighter " (power)"
  :keymap ruby-power-map
  (setup 'inf-ruby (inf-ruby-minor-mode t))
  (setup 'rspec-mode
         (setq rspec-use-rake-when-possible nil)
         (with-eval-after-load 'inf-ruby
           (inf-ruby-switch-setup)))
  (setup 'robe
         (robe-mode)
         (start-robe-server))
  (setup 'projectile-rails
         (add-hook 'projectile-mode-hook 'projectile-rails-on))
  (setup 'smartparens
         (require 'smartparens-config)
         (require 'smartparens-ruby)
         (smartparens-mode))
  (ruby-key-bindings))

(defun ruby-key-bindings ()
  (with-eval-after-load 'evil
    (require 'evil)
    (define-key evil-normal-state-map (kbd "gf") 'projectile-rails-goto-file-at-point))
  (with-eval-after-load 'evil-leader
    (require 'evil-leader)
    (evil-leader/set-key
      "." 'goto-spec-or-target
      "T" 'rspec-verify-single
      "t" 'rspec-verify
      "r" 'rspec-rerun)))

(defun goto-spec-or-target ()
  (interactive)
  (or (rspec-find-spec-or-target-other-window)
      (projectile-rails-find-current-spec)))

(defun start-robe-server()
  (save-excursion
    (window-configuration-to-register 'a)
    (inf-ruby)
    (set-process-query-on-exit-flag (get-process "ruby") nil)
    (robe-start)
    (jump-to-register 'a)))

(defun ruby/engage-power ()
  (ruby-power-mode t))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'ruby/engage-power))
