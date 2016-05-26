(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default js2-mode-indent-ignore-first-tab t
              js2-mode-show-parse-errors nil
              js2-strict-inconsistent-return-warning nil
              js2-strict-var-hides-function-arg-warning nil
              js2-strict-missing-semi-warning nil
              js2-strict-trailing-comma-warning nil
              js2-strict-cond-assign-warning nil
              js2-strict-var-redeclaration-warning nil)
(setq-default js2-global-externs '("module" "require" "process" "console"))

(defun prettify-js-symbols ()
  (push '("->" . ?→) prettify-symbols-alist)
  (push '("=>" . ?⇒) prettify-symbols-alist)
  (push '("==" . ?⩵) prettify-symbols-alist)
  (push '("===" . ?⩶) prettify-symbols-alist)
  (push '("function" . ?∫) prettify-symbols-alist)
  (prettify-symbols-mode))

(defun setup-js-mocha ()
  (require 'mocha)
  (setq-default mocha-extra-args "--compilers js:babel-core/register")
  (local-set-key (kbd "C-c , v") #'mocha-verify-file-in-buffer)
  (local-set-key (kbd "C-c , r") #'mocha-verify-last))

(defun setup-js-flycheck ()
  (require 'flow-types)
  (with-eval-after-load 'flycheck
    (require 'flycheck-javascript-flow)
    (add-to-list 'flycheck-checkers 'javascript-flow)))

(defun setup-js-mode ()
  (setup-js-mocha)
  (prettify-js-symbols)
  (setup-js-flycheck))
(add-hook 'js-mode-hook #'setup-js-mode)
(add-hook 'js2-mode-hook #'setup-js-mode)
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(with-eval-after-load 'js2-refactor
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
