(require 'which-key)
(which-key-setup-minibuffer)
(which-key-mode)

(define-key minibuffer-local-map (kbd "C-u") (bind (kill-line 0)))

(global-set-key (kbd "s-0") (bind (text-scale-adjust 0)))
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(with-eval-after-load 'company
  (define-key company-mode-map (kbd "<C-return>") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(require 'avy)
(with-eval-after-load 'avy
  (global-set-key (kbd "C-:") 'avy-goto-char))

(require 'toggle-quotes)
(with-eval-after-load 'toggle-quotes
  (global-set-key (kbd "C-'") 'toggle-quotes))

(with-eval-after-load 'etags-select
  (global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)
  (global-set-key (kbd "M-?") 'etags-select-find-tag))

(with-eval-after-load 'magit
  (global-set-key (kbd "C-c g") 'magit-status))

(with-eval-after-load 'ag
  (global-set-key (kbd "s-F") 'ag-project))

(with-eval-after-load 'neotree
  (global-set-key [f8] 'neotree-toggle))

(with-eval-after-load 'dash-at-point
  (global-set-key (kbd "C-c d") 'dash-at-point))

(with-eval-after-load 'delimator
  (global-set-key (kbd "C-c f d") 'delimator-delete-buffer-file))

(provide 'key-bindings)
