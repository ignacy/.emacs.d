(require 'evil)

(global-evil-leader-mode)
(evil-mode 1)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "r" 'ido-recentf-open
 "f" 'fiplr-find-file
 "'" 'ido-goto-symbol
 "k" 'kill-buffer)


(provide 'setup-evil)
