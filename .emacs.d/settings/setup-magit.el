(require 'magit)
(setq magit-push-always-verify nil
      magit-no-confirm (list 'discard 'revert 'stage-all-changes 'unstage-all-changes))

(with-eval-after-load 'evil
  (add-to-list 'evil-emacs-state-modes 'magit-mode))

(provide 'setup-magit)
