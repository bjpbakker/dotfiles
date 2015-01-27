; mode line
(line-number-mode 1)
(column-number-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

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
(load-conf 'ui)
(load-conf 'evil-mode)

(require 'ir-black-theme)
