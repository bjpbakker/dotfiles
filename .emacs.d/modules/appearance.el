(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq use-dialog-box nil)

(defun themes/light ()
  (interactive)
  (load-theme 'leuven t)
  (global-hl-line-mode -1))
(themes/light)

(global-linum-mode t)
(setq linum-disabled-modes '(help-mode shell-mode))
(defun linum-on ()
  (unless (or (minibufferp)
              (member major-mode linum-disabled-modes))
    (linum-mode 1)))

;; highlight unnecessary whitespace
(setq-default whitespace-style '(face trailing tabs empty))

;; highlight long lines
(require 'column-enforce-mode)
(setq column-enforce-column nil)
(add-hook 'prog-mode-hook 'column-enforce-mode)

;; srsly..
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; graphical emacs enhancements
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)

  (require 'fonts)
  (setq fonts-screen-preset-alist '(("macbook" . "Source Code Pro-13")
                                    ("dell" . "Source Code Pro-13")
                                    ("thunderbolt" . "Source Code Pro-15")
                                    ("big-screen" . "Source Code Pro-19")))
  (fonts-load-screen-preset "macbook"))

(add-hook 'after-init-hook 'toggle-frame-fullscreen)

(provide 'appearance)
