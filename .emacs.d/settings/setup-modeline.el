(defun modeline-set-lighter (minor-mode lighter)
  (when (assq minor-mode minor-mode-alist)
    (setcar (cdr (assq minor-mode minor-mode-alist)) lighter)))

(display-time-mode)
(require 'smart-mode-line)
(setq sml/shorten-directory t
      sml/shorten-modes t
      sml/name-width '(40 . 100)
      sml/mode-width 'full
      sml/no-confirm-load-theme t
      sml/theme 'powerline)

;; rich-minority-mode is automatically enabled by smart-mode-line
(require 'regexp-helper)
(setq rm-blacklist (regexp-alternatives
                    '("company"
                      "," ;; subword
                      "WK"
                      ".*Doc"
                      "Projectile.*")))
(modeline-set-lighter 'paredit-mode " ⒮")
(modeline-set-lighter 'whitespace-mode " ␣")

(sml/setup)

(provide 'setup-modeline)
