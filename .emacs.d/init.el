(defun load-conf (mod)
  "Load configuration module from user-emacs-directory. If mod is a symbol
the file to load is based on the convention of '(symbol-name mod).el'"
  (let ((settings-directory (concat user-emacs-directory "/settings")))
    (let ((filename (if (symbolp mod) (concat (symbol-name mod) ".el") mod)))
      (load (expand-file-name filename settings-directory)))))

(load-conf 'bundle)
(load-conf 'navigation)
(load-conf 'editor)
(load-conf 'evil-mode)
(load-conf 'flycheck)
(load-conf 'rainbow-delimiters)
(load-conf 'ui)
(load-conf 'osx)
(load-conf 'power-lisp)
(load-conf 'clojure)
(load-conf 'markdown)
(load-conf 'ruby)
(load-conf 'sh-mode)
(load-conf 'key-bindings)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)

(require 'ir-black-theme)
