(require 'erc)

(setq erc-user-full-name "Bart Bakker"
      erc-interpret-mirc-color t
      erc-kill-buffer-on-part t
      erc-kill-queries-on-quit t
      erc-kill-server-buffer-on-quit t
      erc-query-display 'buffer)

(erc-truncate-mode t)
(erc-spelling-mode t)

(let ((erc-passwords-file (expand-file-name "~/.ercpass")))
  (when (file-exists-p erc-passwords-file)
    (load erc-passwords-file)))

(defun erc-connect/slack ()
  "Connect to Slack"
  (interactive)
  (erc-tls :server "trythisjob.irc.slack.com" :port 6667
           :nick "bjpbakker" :password slack-connect-password))

(with-eval-after-load 'evil
  (add-to-list 'evil-emacs-state-modes #'erc-mode))

(provide 'setup-erc)
