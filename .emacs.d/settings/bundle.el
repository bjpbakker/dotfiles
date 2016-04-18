(require 'package)
(require 'cl-lib)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(defvar bart/packages nil
  "Packages required at runtime")

(setq bart/packages
      '(exec-path-from-shell
        flx-ido ido-ubiquitous ido-vertical-mode smex swiper ;; fuzzy match files, buffers, and more
        projectile ;; open projects, files and more
        neotree etags-select ;; navigation
        avy expand-region fillcode paredit rainbow-delimiters toggle-quotes idle-highlight ;; editing
        company company-flx ;; completion
        flycheck ;; syntax checking
        editorconfig ;; project-based configuration
        which-key ;; help on key bindings and stuff
        smart-mode-line smart-mode-line-powerline-theme column-enforce-mode ;; ui enhancements
        rainbow-mode ;; display color strings
        clojure-mode cider ;; clojure
        elixir-mode ;; elixir
        haskell-mode ;; haskell
        js2-mode ;; javascript
        markdown-mode writegood-mode ;; markdown
        purescript-mode flycheck-purescript psci ;; purescript
        ruby-end inf-ruby rbenv bundler rspec-mode projectile-rails goto-gem ruby-refactor ruby-hash-syntax ;; ruby
        rust-mode flycheck-rust racer cargo company-racer ;; rust
        yaml-mode ;; yaml
        swift-mode company-sourcekit ;; swift
        web-mode less-css-mode haml-mode sass-mode ;; web support
        magit ag dash-at-point ;; tools
        org deft ;; org-mode tools
        alect-themes zerodark-theme select-themes)) ;; color themes

(defun install-missing-packages ()
  (interactive)
  (unless (cl-every #'package-installed-p bart/packages)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg bart/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg)))))

(provide 'bundle)
