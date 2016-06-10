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
                  (mapcar 'expand-file-name '("~/.node-modules/bin"
                                              "~/.rbenv/shims"))
                  '("/usr/local/bin" "/usr/local/sbin")
                  exec-path)))
(setenv "PATH" (mapconcat 'identity exec-path ":"))

(require 'tls)

(let ((ca-bundle-file (nix-file-path "/etc/ssl/certs/ca-bundle.crt")))
  (setq tls-checktrust t
	tls-program (list (format "gnutls-cli --x509cafile %s -p %%p %%h"
				  ca-bundle-file))
	gnutls-trustfiles (list ca-bundle-file)))

(provide 'nix)
