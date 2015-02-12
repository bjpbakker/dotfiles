(require 'config-util)
(require 'ruby-mode)

(defvar ruby-power-map (make-keymap))
(define-minor-mode ruby-power-mode "Add power to Ruby"
  :lighter " (power)"
  :keymap ruby-power-map
  (setup 'rspec-mode
         (setq rspec-use-rake-when-possible nil
               compilation-scroll-output t))
  (setup 'projectile-rails
         (projectile-rails-on))
  (setup 'inf-ruby
         (inf-ruby-minor-mode t)
         (inf-ruby-switch-setup))
  (setup 'robe
         (robe-mode)
         (push 'company-robe company-backends)
         (start-robe-server))
  (setup 'electric
         (electric-pair-mode))
  (setup 'ruby-end
         (ruby-end-mode))
  (setup 'rainbow-delimiters
         (rainbow-delimiters-mode))
  (ruby-key-bindings))

(defun ruby-console ()
  (interactive)
  (cl-letf (((symbol-function 'completing-read) (always "test")))
    (inf-ruby-console-auto)))

(defun ruby-key-bindings ()
  (with-eval-after-load 'evil
    (require 'evil)
    (define-key evil-normal-state-map (kbd "gf") 'projectile-rails-goto-file-at-point)
    (define-key evil-normal-state-map (kbd "g.") 'robe-jump))
  (with-eval-after-load 'evil-leader
    (require 'evil-leader)
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

(defun start-robe-server()
  (save-excursion
    (window-configuration-to-register 'a)
    (ruby-console)
    (set-process-query-on-exit-flag (or (get-process "ruby") (get-process "rails")) nil)
    (robe-start)
    (jump-to-register 'a)))

(defun ruby/engage-power ()
  (ruby-power-mode t))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'ruby/engage-power))
