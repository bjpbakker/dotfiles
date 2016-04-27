(require 'cl-lib)

(defconst dot-emacs-d (file-name-directory (file-chase-links load-file-name)))
(defconst emacs-temp-directory (concat user-emacs-directory "temp/"))

;; Keep small custom packages in the `elisp` subfolder and the various parts
;; of my configuration in the `modules` subfolder.
(add-to-list 'load-path (concat dot-emacs-d "elisp"))
(add-to-list 'load-path (concat dot-emacs-d "modules"))

(require 'bundle)
(install-missing-packages)

(require 'mac)
(require 'defaults)
(require 'appearance)
(require 'more-help)
(require 'setup-modeline)
(require 'setup-ido)
(require 'setup-ivy)
(require 'setup-projectile)
(require 'setup-flycheck)
(require 'setup-company)
(require 'setup-editorconfig)
(require 'setup-rainbow-delimiters)
(require 'setup-org-mode)
(require 'setup-web-mode)
(require 'setup-magit)
(require 'setup-erc)
(require 'setup-neotree)
(require 'setup-window-movement)
(require 'misc)
(require 'key-bindings)

;; load programming language configurations
(let ((languages-config-dir (concat user-emacs-directory "languages")))
  (dolist (f (directory-files languages-config-dir t ".el$"))
    (load f)))

(setq make-backup-files nil
      auto-save-file-name-transforms `((".*" ,emacs-temp-directory t)))
