(ignore-errors
 (load-file (concat imoryc-dir "/themes/bubbleberry-theme.el"))
 (load-theme 'bubbleberry t))

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Diff/git addons
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

;;(set-face-attribute 'default nil :font "Monaco-14")

(provide 'im-set-colors)
