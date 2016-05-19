(require 'package)
(require 'cl-lib)

(package-initialize)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(defvar bart/packages nil
  "Packages required at runtime")

(setq bart/packages
      '(
        ;; fuzzy match files, buffers, and more
        flx-ido ido-ubiquitous ido-vertical-mode
        ivy swiper counsel counsel-projectile flx

        ;; projects
        projectile editorconfig neotree etags-select

        ;; editing
        undo-tree expand-region
        fillcode paredit embrace toggle-quotes
        avy rainbow-delimiters
        rainbow-delimiters idle-highlight-mode rainbow-mode

        ;; window movement
        ace-window

        ;; completion
        company company-flx

        ;; syntax checking
        flycheck flycheck-tip

        ;; more help
        which-key discover-my-major

        ;; ui enhancements
        smart-mode-line column-enforce-mode

        ;; color themes
        select-themes
        alect-themes ample-theme minimal-theme leuven-theme

        ;; clojure
        clojure-mode cider

        ;; haskell
        haskell-mode flycheck-stack

        ;; javascript
        js2-mode

        ;; markdown
        markdown-mode writegood-mode

        ;; purescript
        purescript-mode flycheck-purescript psci

        ;; ruby
        ruby-end inf-ruby rbenv bundler rspec-mode projectile-rails
        goto-gem ruby-refactor ruby-hash-syntax

        ;; rust
        rust-mode flycheck-rust racer cargo company-racer

        ;; yaml
        yaml-mode

        ;; swift
        swift-mode company-sourcekit

        ;; html, css (and preprocessors), and multi mode
        web-mode less-css-mode haml-mode sass-mode

        ;; debugging
        realgud

        ;; git
        magit

        ;; org
        org deft

        ;; misc tools
        ag dash-at-point
))

(defun install-missing-packages ()
  (interactive)
  (unless (cl-every #'package-installed-p bart/packages)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg bart/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg)))))

(provide 'bundle)
