(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)
(require 'ido-vertical-mode)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" emacs-temp-directory)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)

(ido-mode t)
(ido-ubiquitous-mode t)

(flx-ido-mode t)
(setq ido-use-faces nil) ;; show flx highlights

(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'setup-ido)
