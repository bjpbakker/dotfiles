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

;; show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; replace active region if inserting text
(delete-selection-mode 1)

;; display line and column numbers in mode-line
(setq line-number-mode 1)
(setq column-number-mode 1)

;; sensible default for line length would be 80
(setq fill-column 80)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines nil)

(global-subword-mode t)

(setq gc-cons-percentage 20000000)

;; smooth scrolling
(setq scroll-margin 8
      scroll-conservatively 10000
      scroll-preserve-screen-position t)

(with-eval-after-load "vc"
  '(setq vc-handled-backends nil))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'defaults)
