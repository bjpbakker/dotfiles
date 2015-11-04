(autoload 'web-mode "web-mode")
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(with-eval-after-load 'flycheck
  (require 'flycheck-javascript-flow)
  (add-to-list 'flycheck-checkers 'javascript-flow))

(defun setup-js-mode ()
  (require 'mocha)
  (setq mocha-extra-args "--compilers js:babel-core/register")
  (define-key js-mode-map (kbd "C-c , v") #'mocha-verify-file))

(add-hook 'js-mode-hook #'setup-js-mode)
