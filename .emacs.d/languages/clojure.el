(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(require 'cider)
(add-hook 'clojure-mode-hook #'cider-mode)
(add-hook 'cider-mode-hook #'clojure/customize-cider)

(defun clojure/customize-cider ()
  (setq cider-show-error-buffer 'except-in-repl
        cider-auto-select-error-buffer nil)
  (define-key cider-mode-map (kbd "<f1>") 'cider-doc))
