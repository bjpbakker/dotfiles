(autoload 'js2-mode "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

(setq-default js2-mode-show-parse-errors nil
              js2-strict-inconsistent-return-warning nil
              js2-strict-var-hides-function-arg-warning nil
              js2-strict-missing-semi-warning nil
              js2-strict-trailing-comma-warning nil
              js2-strict-cond-assign-warning nil
              js2-strict-var-redeclaration-warning nil)

(defun setup-js-mode ()
  (require 'mocha)
  (setq-default mocha-extra-args "--compilers js:babel-core/register")
  (define-key js-mode-map (kbd "C-c , v") #'mocha-verify-file-in-buffer)
  (define-key js-mode-map (kbd "C-c , r") #'mocha-verify-last)
  (with-eval-after-load 'flycheck
    (require 'flycheck-javascript-flow)
    (add-to-list 'flycheck-checkers 'javascript-flow))
  (require'ctags)
  (setq ctags-languages '("JavaScript"))
  (add-to-list 'ctags-lang-kinds-alist '(JavaScript. "fcmpv"))
  (add-to-list 'ctags-excludes "dist"))
(add-hook 'js-mode-hook #'setup-js-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
