(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; use GitHub-flavored Markdown for README.md
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(defun setup-markdown-mode ()
  (visual-line-mode)
  (writegood-mode))

(add-hook 'markdown-mode-hook #'setup-markdown-mode)
