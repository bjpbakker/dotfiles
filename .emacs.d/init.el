(setq inhibit-spash-screen t
      initial-scratch-message nil)

; mode line
(line-number-mode 1)
(column-number-mode 1)

; srsly..
(unless (display-graphic-p)
  (menu-bar-mode -1))

(defalias 'yes-or-no-p 'y-or-n-p)

; graphical emacs enhancements
(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Inconsolata-g-13")
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-frame-size (selected-frame) 120 40))

(global-hl-line-mode)
(global-linum-mode 1)

(setq make-backup-files nil)

(defun load-conf (mod)
  "Load configuration module from user-emacs-directory. If mod is a symbol
the file to load is based on the convention of '(symbol-name mod).el'"
  (let ((filename (if (symbolp mod) (concat (symbol-name mod) ".el") mod)))
    (load (expand-file-name filename user-emacs-directory))))

(load-conf 'bundle)
(load-conf 'navigation)
(load-conf 'editor)
(load-conf 'evil-mode)

(require 'ir-black-theme)
