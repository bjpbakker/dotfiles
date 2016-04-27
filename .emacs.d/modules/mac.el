(require 'config-util)

(setup 'exec-path-from-shell
  (exec-path-from-shell-initialize))

;; use pre-Lion style fullscreen
(setq ns-use-native-fullscreen nil)

;; always use the current frame
(setq ns-pop-up-frames nil)

(provide 'mac)
