(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq use-dialog-box nil)

(global-linum-mode -1)
(global-hl-line-mode 1)

;; highlight unnecessary whitespace
(setq-default whitespace-style '(face trailing tabs empty))

;; highlight long lines
(require 'column-enforce-mode)
(setq column-enforce-column nil)
(add-hook 'prog-mode-hook 'column-enforce-mode)

(require 'alect-themes)
(load-theme 'alect-black t)
(enable-theme 'alect-black)

;; srsly..
(unless (display-graphic-p)
  (menu-bar-mode -1))

;; graphical emacs enhancements
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)

  (require 'fonts)
  (setq fonts-screen-preset-alist '(("macbook" . "Source Code Pro-13")
                                    ("thunderbolt" . "Source Code Pro-15")
                                    ("big-screen" . "Source Code Pro-19")))
  (fonts-load-screen-preset "macbook"))

(add-hook 'after-init-hook 'toggle-frame-fullscreen)

(provide 'appearance)