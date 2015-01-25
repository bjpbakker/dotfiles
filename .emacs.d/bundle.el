(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(defvar bart/packages
  '(projectile flx-ido ido-ubiquitous ido-vertical-mode
    evil evil-commentary evil-leader evil-paredit
    rainbow-delimiters
    clojure-mode
    ir-black-theme)
  "Packages required at runtime")

(defun bundle-install ()
  (interactive)
  (package-refresh-contents)
  (dolist (package bart/packages)
    (condition-case err
        (package-install package)
      (error
       (message "%s" (error-message-string err))))))
