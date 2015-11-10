(autoload 'js2-mode "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default js2-mode-show-parse-errors nil
              js2-strict-inconsistent-return-warning nil
              js2-strict-var-hides-function-arg-warning nil
              js2-strict-missing-semi-warning nil
              js2-strict-trailing-comma-warning nil
              js2-strict-cond-assign-warning nil
              js2-strict-var-redeclaration-warning nil)

(autoload 'javascript-flow "flycheck-javascript-flow")

(defun setup-js2-mode ()
  (require 'mocha)
  (setq-default mocha-extra-args "--compilers js:babel-core/register")
  (define-key js2-mode-map (kbd "C-c , v") #'mocha-verify-file)
  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-checkers 'javascript-flow)))
(add-hook 'js2-mode-hook #'setup-js2-mode)

(autoload 'web-mode "web-mode")
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
