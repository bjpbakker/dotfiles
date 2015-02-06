(require 'ruby-mode)

(defvar ruby-power-map (make-keymap))
(define-minor-mode ruby-power-mode "Add power to Ruby"
  :lighter " (power)"
  :keymap ruby-power-map
  (require 'ruby-electric)
  (ruby-electric-mode t)
  (inf-ruby-minor-mode t)
  (ruby-key-bindings)
  (add-hook 'projectile-mode-hook 'projectile-rails-on))

(defun ruby-key-bindings ()
  (with-eval-after-load 'evil
    (require 'evil)
    (define-key evil-normal-state-map (kbd "gf") 'projectile-rails-goto-file-at-point))
  (with-eval-after-load 'evil-leader
    (require 'evil-leader)
    (evil-leader/set-key
      "." 'rspec-find-spec-or-target-find-example-other-window)))

(defun ruby/engage-power ()
  (ruby-power-mode t))

(with-eval-after-load 'ruby-mode
  (add-hook 'ruby-mode-hook #'ruby/engage-power))
