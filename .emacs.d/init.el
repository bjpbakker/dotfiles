(defconst emacs-temp-directory (concat user-emacs-directory "temp/"))
(defconst emacs-settings-directory (concat user-emacs-directory "settings/"))

(add-to-list 'load-path (concat user-emacs-directory "elisp/"))

(defun load-conf (mod)
  "Load configuration module from user-emacs-directory. If mod is a symbol
the file to load is based on the convention of '(symbol-name mod).el'"
  (let ((filename (if (symbolp mod) (concat (symbol-name mod) ".el") mod)))
    (load (expand-file-name filename emacs-settings-directory))))

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
(load-conf 'power-ruby)
(load-conf 'sh-mode)
(load-conf 'misc)
(load-conf 'org-mode)
(load-conf 'key-bindings)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil
      auto-save-file-name-transforms `((".*" ,emacs-temp-directory t)))
