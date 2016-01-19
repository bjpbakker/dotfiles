(require 'magit)
(setq magit-no-confirm '(discard revert stage-all-changes unstage-all-changes))

(with-eval-after-load 'evil
  (add-to-list 'evil-emacs-state-modes 'magit-mode))

(provide 'setup-magit)
