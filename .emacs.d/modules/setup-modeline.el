(require 'smart-mode-line)
(setq sml/shorten-directory t
      sml/shorten-modes t
      sml/name-width '(40 . 100)
      sml/mode-width 'full
      sml/no-confirm-load-theme t
      sml/theme 'respectful)

;; rich-minority-mode is automatically enabled by smart-mode-line
(require 'regexp-helper)
(setq rm-blacklist (regexp-alternatives
                    '("company"
                      "," ;; subword
                      "WK"
                      " .*Doc"
                      "Projectile.*")))

(sml/setup)

(provide 'setup-modeline)
