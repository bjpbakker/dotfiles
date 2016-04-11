(display-time-mode)
(require 'smart-mode-line)
(setq sml/shorten-directory t
      sml/shorten-modes t
      sml/name-width '(40 . 100)
      sml/mode-width 'full
      sml/no-confirm-load-theme t
      sml/theme 'powerline)

;; (rich-minority-mode 1)
;; (setf rm-blacklist "")

(sml/setup)

(setup 'delight
  (delight '((auto-revert-mode " 归" autorevert)
             (company-mode nil company)
             (column-enforce-mode nil)
             (eldoc-mode nil eldoc)
             (evil-commentary-mode nil evil-commentary)
             (helm-mode " ⎈")
             (magit-auto-revert-mode nil magit)
             (paredit-mode " ⒮" paredit)
             (paredit-non-lisp-mode " ⒮" paredit-non-lisp)
             (projectile-mode nil projectile)
             (projectile-rails-mode nil projectile-rails)
             (rspec-mode nil)
             (ruby-end-mode nil ruby-end)
             (ruby-refactor-mode nil ruby-refactor)
             (ruby-tools-mode nil ruby-tools)
             (racer-mode nil racer)
             (subword-mode nil subword)
             (undo-tree-mode nil undo-tree)
             (which-key-mode nil which-key)
             (whitespace-mode " ␣" whitespace))))

(provide 'setup-modeline)
