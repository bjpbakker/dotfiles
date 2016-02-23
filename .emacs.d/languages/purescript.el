(require 'purescript-mode)
(add-hook 'purescript-mode-hook #'purescript/customize)

(defun purescript/customize ()
  (turn-on-purescript-indentation)
  (push '("->" . ?→) prettify-symbols-alist)
  (push '("::" . ?∷) prettify-symbols-alist)
  (prettify-symbols-mode)
  (with-eval-after-load 'flycheck
    (require 'flycheck-purescript)
    (flycheck-purescript-setup)))
