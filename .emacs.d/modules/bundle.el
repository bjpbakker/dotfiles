(require 'package)
(require 'cl-lib)

(package-initialize)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(defvar bart/packages nil
  "Packages required at runtime")

(setq bart/packages
      '(flx-ido ido-ubiquitous ido-vertical-mode ;; fuzzy match files, buffers, and more
        ivy swiper counsel counsel-projectile flx ;; Ivy search and fuzzy matching
        projectile ;; open projects, files and more
        neotree etags-select ;; navigation
        undo-tree avy expand-region embrace fillcode paredit rainbow-delimiters toggle-quotes idle-highlight-mode ;; editing
        ace-window ;; window control
        company company-flx ;; completion
        flycheck flycheck-tip ;; syntax checking
        editorconfig ;; project-based configuration
        which-key discover-my-major ;; more help
        smart-mode-line column-enforce-mode ;; ui enhancements
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
        realgud ;; debugging
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
