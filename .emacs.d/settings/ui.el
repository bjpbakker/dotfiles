(require 'config-util)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq echo-keystrokes 0.1
      use-dialog-box nil)

(line-number-mode 1)
(column-number-mode 1)

(global-linum-mode -1)
(global-hl-line-mode 1)

;; smooth scrolling
(setq scroll-margin 8
      scroll-conservatively 10000)

;; defaults for line length indicator
(setup 'fill-column-indicator
       (setq fci-rule-column 115
             fci-rule-width 1
             fci-rule-color "#4d4d4d"))

(setup 'zerodark-theme
       (load-theme 'zerodark t))

;; srsly..
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; graphical emacs enhancements
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (setup 'fonts
         (setq fonts-screen-preset-alist '(("macbook" . "Source Code Pro-13")
                                           ("thunderbolt" . "Source Code Pro-15")
                                           ("big-screen" . "Source Code Pro-19")))
         (fonts-load-screen-preset "macbook"))
  (setq ns-use-native-fullscreen nil) ;; use pre-Lion style fullscreen
  (add-hook 'after-init-hook 'toggle-frame-fullscreen))

(setup 'delight
       (delight '((company-mode nil company)
                  (eldoc-mode nil eldoc)
                  (evil-commentary-mode nil evil-commentary)
                  (flycheck-mode " ✓" flycheck)
                  (magit-auto-revert-mode nil magit)
                  (paredit-mode nil paredit)
                  (paredit-non-lisp-mode nil paredit-non-lisp)
                  (projectile-mode nil projectile)
                  (projectile-rails-mode nil projectile-rails)
                  (robe-mode nil robe)
                  (rspec-mode nil)
                  (ruby-end-mode nil ruby-end)
                  (ruby-refactor-mode nil ruby-refactor)
                  (ruby-tools-mode nil ruby-tools)
                  (undo-tree-mode nil undo-tree)
                  (which-key-mode nil which-key))))

(setup 'telephone-line
       (setq telephone-line-lhs
             '((evil   . (telephone-line-evil-tag-segment))
               (accent . (telephone-line-vc-segment
                          telephone-line-process-segment))
               (nil    . (telephone-line-buffer-segment))))
       (setq telephone-line-rhs
             '((evil   . (telephone-line-airline-position-segment))
               (accent . (telephone-line-major-mode-segment
                          telephone-line-minor-mode-segment))
               (nil    . (telephone-line-misc-info-segment))))
       (set-face-attribute 'telephone-line-evil nil :foreground "black")
       (set-face-attribute 'telephone-line-evil-normal nil :background "lemon chiffon")
       (set-face-attribute 'telephone-line-evil-insert nil :background "deep sky blue")
       (set-face-attribute 'telephone-line-evil-visual nil :background "goldenrod")
       (set-face-attribute 'telephone-line-evil-motion nil :background "pale green")
       (telephone-line-mode 1))
