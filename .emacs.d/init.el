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
  (scroll-bar-mode 0)
  (set-frame-size (selected-frame) 120 40))

(global-hl-line-mode)
(global-linum-mode 1)

(defun load-conf (mod)
  "Load configuration module from user-emacs-directory. If mod is a symbol
the file to load is based on the convention of (symbol-name mod) appended
with '.el'."
  (let ((filename (if (symbolp mod) (concat (symbol-name mod) ".el") mod)))
    (load (expand-file-name filename user-emacs-directory))))

(load-conf 'bundle)
(load-conf 'navigation)
(load-conf 'editor)
(load-conf 'evil-mode)

(require 'ir-black-theme)
