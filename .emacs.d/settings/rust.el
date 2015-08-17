(require 'config-util)

(setup 'rust-mode
       (add-hook 'rust-mode-hook 'rust/customize))

(defun rust/customize ()
  (setup 'racer
         (setq racer-rust-src-path "/Users/bart/src/rust/src"
               racer-cmd "/Users/bart/bin/racer")
         (racer-activate))
  (setup 'flycheck-rust
         (flycheck-rust-setup))
  (setup 'rainbow-delimiters
         (rainbow-delimiters-mode)))
