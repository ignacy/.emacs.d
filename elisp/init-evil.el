(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'ido-find-file
  "b" 'ido-switch-buffer
  "f" 'simp-project-find-file
  "r" 'ido-recentf-open
  "-" 'evil-split-buffer
  "|" 'split-window-horizontally
  "k" 'kill-buffer)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil)
(evil-mode 1)

(provide 'init-evil)
