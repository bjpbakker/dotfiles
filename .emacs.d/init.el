(require 'cl-lib)

(defconst emacs-temp-directory (concat user-emacs-directory "temp/"))

(defun user-emacs-dir-add-to-load-path (dir)
  (add-to-list 'load-path (concat user-emacs-directory dir)))
(dolist (dir '("elisp" "settings"))
  (user-emacs-dir-add-to-load-path dir))

(require 'bundle)
(install-missing-packages)
(require 'mac)
(require 'defaults)
(require 'appearance)
(require 'setup-ido)
(require 'setup-projectile)
(require 'setup-flycheck)
(require 'setup-company)
(require 'setup-editorconfig)
(require 'setup-rainbow-delimiters)
(require 'setup-org-mode)
(require 'setup-magit)
(require 'setup-evil)
(require 'setup-neotree)
(require 'misc)
(require 'key-bindings)
(require 'cheatsheets)

;; load programming language configurations
(let ((languages-config-dir (concat user-emacs-directory "languages")))
  (dolist (f (directory-files languages-config-dir t ".el$"))
    (load f)))

(setq make-backup-files nil
      auto-save-file-name-transforms `((".*" ,emacs-temp-directory t)))
