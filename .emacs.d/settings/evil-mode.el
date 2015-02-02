(require 'evil)
(require 'evil-leader)
(require 'evil-commentary)
(require 'evil-jumper)

(global-evil-leader-mode)
(evil-mode 1)

(setq evil-jumper-auto-center t)
(global-evil-jumper-mode t)

(evil-commentary-mode)
