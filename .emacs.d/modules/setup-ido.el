(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)
(require 'ido-vertical-mode)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-default-file-method 'selected-window
      ido-max-prospects 10
      ido-use-faces nil ;; see flx highlights
      ido-vertical-define-keys 'C-n-and-C-p-only
      ido-save-directory-list-file (expand-file-name "ido.hist" emacs-temp-directory)
      ido-auto-merge-work-directories-length -1)

(ido-mode t)
(ido-ubiquitous-mode t)
(flx-ido-mode t)
(ido-vertical-mode t)

(provide 'setup-ido)
