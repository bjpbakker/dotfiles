(require 'config-util)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; srsly..
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; graphical emacs enhancements
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Inconsolata-g-13")
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (toggle-frame-fullscreen))

(setq echo-keystrokes 0.1
      use-dialog-box nil)

;; mode line
(setup 'delight
       (delight '((company-mode nil company)
                  (eldoc-mode nil eldoc)
                  (evil-commentary-mode nil evil-commentary)
                  (flycheck-mode nil flycheck)
                  (magit-auto-revert-mode nil magit)
                  (paredit-mode nil paredit)
                  (paredit-non-lisp-mode nil paredit-non-lisp)
                  (projectile-mode nil projectile)
                  (projectile-rails-mode nil projectile-rails)
                  (robe-mode nil robe)
                  (rspec-mode nil)
                  (ruby-end-mode nil ruby-end)
                  (ruby-refactor-mode nil ruby-refactor)
                  (undo-tree-mode nil undo-tree))))
(setup 'powerline
       (powerline-evil-center-color-theme))
(line-number-mode 1)
(column-number-mode 1)

(global-linum-mode 1)
(global-hl-line-mode 1)

;; smooth scrolling
(setq scroll-margin 3
      scroll-conservatively 10000)

;; defaults for line length indicator
(setup 'fill-column-indicator
       (setq fci-rule-width 1
             fci-rule-color "#4d4d4d"))

(setup 'theme-changer
       (setq calendar-location-name "Amsterdam, The Netherlands"
             calendar-latitude 52.3667
             calendar-longitude 4.9)
       (change-theme 'sanityinc-tomorrow-day 'darkburn))
