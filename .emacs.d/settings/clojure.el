(require 'config-util)

(setup 'clojure-mode
       (add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode)))

(setup 'cider
       (add-hook 'clojure-mode-hook #'cider-mode)
       (add-hook 'cider-mode #'clojure/customize-cider))

(defun clojure/customize-cider ()
  (with-eval-after-load 'evil-leader
    (evil-leader/set-key
      "T" 'cider-test-run-test
      "t" 'cider-test-run-tests
      "r" 'cider-test-rerun-tests)))
