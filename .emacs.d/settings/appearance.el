(require 'config-util)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq use-dialog-box nil)

(global-linum-mode -1)
(global-hl-line-mode 1)

;; defaults for line length indicator
(setup 'fill-column-indicator
  (setq fci-rule-column fill-column
        fci-rule-width 1
        fci-rule-color "#4b50a7"))

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
  (add-hook 'after-init-hook 'toggle-frame-fullscreen))

(setup 'delight
  (delight '((company-mode nil company)
             (eldoc-mode nil eldoc)
             (evil-commentary-mode nil evil-commentary)
             (helm-mode " ⎈")
             (magit-auto-revert-mode nil magit)
             (paredit-mode " ⒮" paredit)
             (paredit-non-lisp-mode " ⒮" paredit-non-lisp)
             (projectile-mode nil projectile)
             (projectile-rails-mode nil projectile-rails)
             (robe-mode nil robe)
             (rspec-mode nil)
             (ruby-end-mode nil ruby-end)
             (ruby-refactor-mode nil ruby-refactor)
             (ruby-tools-mode nil ruby-tools)
             (racer-mode nil racer)
             (undo-tree-mode nil undo-tree)
             (which-key-mode nil which-key)
             (whitespace-mode " ␣" whitespace))))

(setup 'telephone-line
  (defun mode-line-buffer-filename ()
    (when buffer-file-name
      (let* ((root (projectile-project-root))
             (abs-file-path (file-truename (buffer-file-name (current-buffer))))
             (relative-file-path (file-relative-name abs-file-path root)))
        relative-file-path)))

  (telephone-line-defsegment* bart/telephone-line-buffer-segment
    `(""
      mode-line-mule-info
      mode-line-modified
      mode-line-client
      mode-line-remote
      mode-line-frame-identification
      ,(telephone-line-raw (or (mode-line-buffer-filename)
                               mode-line-buffer-identification) t)))

  (setq telephone-line-lhs
        '((evil   . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-process-segment))
          (nil    . (bart/telephone-line-buffer-segment))))
  (setq telephone-line-rhs
        '((nil    . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment
                     telephone-line-minor-mode-segment))
          (evil   . (telephone-line-airline-position-segment))))
  (set-face-attribute 'telephone-line-evil nil :foreground "black")
  (set-face-attribute 'telephone-line-evil-normal nil :background "lemon chiffon")
  (set-face-attribute 'telephone-line-evil-insert nil :background "deep sky blue")
  (set-face-attribute 'telephone-line-evil-visual nil :background "goldenrod")
  (set-face-attribute 'telephone-line-evil-motion nil :background "pale green")
  (telephone-line-mode 1))

(provide 'appearance)
