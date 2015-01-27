(require 'package)
(require 'cl)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(defvar bart/packages
  '(projectile flx-ido ido-ubiquitous ido-vertical-mode
    exec-path-from-shell
    evil evil-commentary evil-leader evil-paredit
    rainbow-delimiters
    clojure-mode
    ir-black-theme)
  "Packages required at runtime")

(unless (every #'package-installed-p bart/packages)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg bart/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
