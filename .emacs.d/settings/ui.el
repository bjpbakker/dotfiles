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
