(require 'package)
(require 'cl)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

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

(unless (every #'package-installed-p bart/packages)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg bart/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
