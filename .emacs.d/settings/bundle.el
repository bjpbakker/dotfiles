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
    ruby-end inf-ruby rbenv bundler rspec-mode projectile-rails ruby-refactor robe ;; ruby
    yaml-mode ;; yaml
    swift-mode ;; swift
    web-mode haml-mode sass-mode ;; web support
    magit ag dash-at-point ;; tools
    org deft ;; org-mode tools
    theme-changer darkburn-theme ir-black-theme lush-theme color-theme-sanityinc-tomorrow) ;; color themes
  "Packages required at runtime")

(defun install-missing-packages ()
  (interactive)
  (unless (cl-every #'package-installed-p bart/packages)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg bart/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg)))))

(install-missing-packages)
