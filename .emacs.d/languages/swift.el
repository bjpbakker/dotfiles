(require 'swift-mode)
(require 'company-sourcekit)

(add-hook 'swift-mode-hook #'swift/customize)

(defun prettify-swift-symbols ()
  (push '("->" . ?→) prettify-symbols-alist)
  (push '("=>" . ?⇒) prettify-symbols-alist)
  (push '("func" . ?∫) prettify-symbols-alist)
  (push '(">>-" . ?⤜) prettify-symbols-alist)
  (prettify-symbols-mode))

(defun swift/customize ()
  (prettify-swift-symbols))

(add-to-list 'company-backend 'company-sourcekit)
