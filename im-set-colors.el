(ignore-errors
 (load-file (concat imoryc-dir "/themes/im-dark-theme.el"))
 (load-theme 'im-dark-theme t))

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Diff/git addons
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(set-face-attribute 'default nil :font "Monaco-16")

(provide 'im-set-colors)
