(require 'config-util)

(setup 'clojure-mode
       (add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode)))

(setup 'inf-clojure
       (add-hook 'clojure-mode-hook 'inf-clojure-minor-mode))
