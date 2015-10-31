(require 'config-util)

(setup 'clojure-mode
       (add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode)))

(setup 'cider
       (add-hook 'clojure-mode-hook #'cider-mode)
       (add-hook 'cider-mode-hook #'clojure/customize-cider))

(defun clojure/customize-cider ()
  (setq cider-show-error-buffer 'except-in-repl
        cider-auto-select-error-buffer nil)
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "g.") 'cider-jump)
    (add-to-list 'evil-emacs-state-modes 'cider-repl-mode))
  (with-eval-after-load 'evil-leader
    (evil-leader/set-key
      "T" 'cider-test-run-test
      "t" 'cider-test-run-tests
      "r" 'cider-test-rerun-tests))
  (define-key cider-mode-map (kbd "<f1>") 'cider-doc))
