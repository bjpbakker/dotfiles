;; auto refresh file and dired buffers
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(setq echo-keystrokes 0.1)

;; open compressed files
(auto-compression-mode t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 it is
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; no blinking cursor
(blink-cursor-mode 0)

;; make selection work as you'd expect
(transient-mark-mode t)
(delete-selection-mode t)

;; display line and column numbers in mode-line
(setq line-number-mode 1)
(setq column-number-mode 1)

;; automatically save buffers compilation
(setq compilation-ask-about-save nil)

;; sensible default for line length would be 80
(setq-default fill-column 80)

;; no tabs and no unnecessary whitespace
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; smoother scrolling
(setq scroll-margin 3
      scroll-conservatively 101
      scroll-preserve-screen-position t
      mouse-wheel-progressive-speed nil)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

(with-eval-after-load "vc"
  '(setq vc-handled-backends nil))

;; get rid of standard bindings for 'suspend-frame
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'undo-tree)
(global-undo-tree-mode)

(provide 'defaults)
