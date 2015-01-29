(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(require 'inf-clojure)
(add-hook 'clojure-mode-hook 'inf-clojure-minor-mode)
