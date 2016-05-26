(add-hook 'clojure-mode-hook #'clojure/setup-mode)

(defun clojure/setup-mode ()
  (require 'cider)
  (setq cider-show-error-buffer 'except-in-repl
        cider-auto-select-error-buffer nil)
  (define-key cider-mode-map (kbd "<f1>") 'cider-doc))
