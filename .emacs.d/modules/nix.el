(require 'cl-lib)

(defgroup nix nil
  "Support for Nix"
  :prefix "nix-"
  :group 'external)

(defcustom nix-profile
  (expand-file-name "~/.nix-profile")
  "Location of the Nix profile.

Equivalent of the `NIX_PROFILE` environment variable."
  :group 'nil
  :type 'string)

(defun nix-file-path (file-name)
  "Return the path to `file-name` relative to the `nix-profile`"
  (concat nix-profile
          (expand-file-name file-name "/")))

(setq exec-path (delete-dups
                 (append
                  (mapcar 'nix-file-path '("/bin" "/sbin"))
                  (mapcar 'expand-file-name '("~/.rbenv/shims"))
                  '("/usr/local/bin" "/usr/local/sbin")
                  exec-path)))
(setenv "PATH" (mapconcat 'identity exec-path ":"))

(with-eval-after-load 'tls
  (let ((cafile (nix-file-path "/etc/ssl/certs/ca-bundle.crt")))
    (setq tls-checktrust t
          tls-program (list (mapconcat 'identity
                                       (list "gnutls-cli"
                                             "--x509cafile"
                                             cafile
                                             "-p %p %h")
                                       " "))
          gnutls-trustfiles (list cafile))))

(provide 'nix)
