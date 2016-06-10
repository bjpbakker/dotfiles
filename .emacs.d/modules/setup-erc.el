(require 'erc)
(require 'erc-services)

(setq erc-user-full-name "Bart Bakker"
      erc-interpret-mirc-color t
      erc-kill-buffer-on-part t
      erc-kill-queries-on-quit t
      erc-kill-server-buffer-on-quit t
      erc-query-display 'buffer
      erc-prompt-for-nickserv-password nil)

(erc-truncate-mode t)
(erc-spelling-mode t)
(erc-services-mode t)

(let ((erc-passwords-file (expand-file-name "~/.ercpass")))
  (when (file-exists-p erc-passwords-file)
    (load erc-passwords-file)))

(setq erc-nickserv-passwords
      `((freenode (("bjpbakker" . ,freenode-nickserv-password)))))

(defun erc-connect/slack ()
  "Connect to Slack"
  (interactive)
  (erc-tls :server "trythisjob.irc.slack.com" :port 6667
           :nick "bjpbakker" :password slack-connect-password))

(defun erc-connect/freenode ()
  "Connect to Freenode IRC"
  (interactive)
  (erc-tls :server "irc.freenode.net" :port 6697
           :nick "bjpbakker" :full-name "Bart"))

(provide 'setup-erc)
