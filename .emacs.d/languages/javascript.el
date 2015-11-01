(autoload 'web-mode "web-mode")
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
