(require 'package)
(require 'cl-lib)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(defvar bart/packages
  '(exec-path-from-shell
    projectile flx-ido ido-ubiquitous ido-vertical-mode ;; fuzzy open files within project
    paredit rainbow-delimiters auto-complete ;; editing
    evil evil-commentary evil-jumper evil-leader evil-paredit ;; modal editing
    flycheck ;; syntax checking
    clojure-mode inf-clojure ;; clojure
    magit ;; tools
    ir-black-theme)
  "Packages required at runtime")

(setq package-pinned-packages '((magit . "marmalade")))

(unless (cl-every #'package-installed-p bart/packages)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg bart/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
