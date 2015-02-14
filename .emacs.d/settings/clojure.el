(require 'config-util)

(setup 'clojure-mode
       (add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode)))

(setup 'cider
       (add-hook 'clojure-mode-hook #'cider-mode))
