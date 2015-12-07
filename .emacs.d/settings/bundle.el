(require 'package)
(require 'cl-lib)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(defvar bart/packages
  '(exec-path-from-shell
    projectile flx-ido ido-ubiquitous ido-vertical-mode ;; open projects, files and more
    helm helm-flx helm-projectile ;; helm
    neotree etags-select ;; navigation
    avy fillcode paredit rainbow-delimiters toggle-quotes ;; editing
    company company-flx ;; completion
    evil evil-commentary evil-jumper evil-leader evil-paredit ;; modal editing
    which-key ;; show available key bindings for a prefix
    flycheck ;; syntax checking
    telephone-line delight fill-column-indicator ;; ui enhancements
    clojure-mode cider ;; clojure
    elixir-mode ;; elixir
    haskell-mode ;; haskell
    js2-mode ;; javascript
    markdown-mode writegood-mode ;; markdown
    purescript-mode psci ;; purescript
    ruby-end inf-ruby rbenv bundler rspec-mode projectile-rails goto-gem ruby-refactor ruby-hash-syntax ;; ruby
    rust-mode flycheck-rust racer cargo company-racer ;; rust
    yaml-mode ;; yaml
    swift-mode ;; swift
    web-mode less-css-mode haml-mode sass-mode ;; web support
    magit ag dash-at-point ;; tools
    org deft ;; org-mode tools
    zerodark-theme quasi-monochrome-theme darkburn-theme zenburn-theme color-theme-sanityinc-tomorrow) ;; color themes
  "Packages required at runtime")

(defun install-missing-packages ()
  (interactive)
  (unless (cl-every #'package-installed-p bart/packages)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg bart/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg)))))

(provide 'bundle)
