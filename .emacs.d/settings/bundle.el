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
    neotree ;; navigation
    paredit rainbow-delimiters company ;; editing
    evil evil-commentary evil-jumper evil-leader evil-paredit ;; modal editing
    flycheck ;; syntax checking
    powerline powerline-evil delight fill-column-indicator ;; ui enhancements
    clojure-mode cider ;; clojure
    markdown-mode writegood-mode ;; markdown
    ruby-end inf-ruby rspec-mode projectile-rails robe ;; ruby
    yaml-mode ;; yaml
    swift-mode ;; swift
    magit ag dash-at-point ;; tools
    org deft ;; org-mode tools
    ir-black-theme)
  "Packages required at runtime")

(setq package-pinned-packages '((magit . "marmalade")))

(unless (cl-every #'package-installed-p bart/packages)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg bart/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
