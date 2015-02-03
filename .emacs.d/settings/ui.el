(setq inhibit-splash-screen t
      initial-scratch-message nil)

; srsly..
(unless (display-graphic-p)
  (menu-bar-mode -1))

; graphical emacs enhancements
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Inconsolata-g-13")
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (toggle-frame-maximized))

(setq echo-keystrokes 0.1
      use-dialog-box nil)

(require 'powerline)
(powerline-evil-center-color-theme)
