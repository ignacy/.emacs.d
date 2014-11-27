(use-package magit
  :init (progn
          (setq magit-completing-read-function 'magit-ido-completing-read)

          ;; (add-hook 'magit-mode-hook (lambda () (setq truncate-lines nil)))
          (defface my-magit-range-info
            '((t :inherit diff-context))
            "Face to highlight range information for a diff."
            :group 'magit-faces)

          (defface my-magit-diff-highlight
            '((t))
            "Face to highlight changes in lines for a diff."
            :group 'magit-faces)

          ;; Change Magit colors for diff highlighting
          (set-face-foreground 'magit-diff-del "red3")
          (set-face-foreground 'magit-diff-add "green3")
          (set-face-foreground 'my-magit-range-info "cyan3")

          ;; ;; Add an extra newline to separate commit message from git commentary
          ;; (set-face-foreground 'magit-diff-add "green3")
          ;; (set-face-foreground 'magit-diff-del "red3")
          ;; (set-face-background 'magit-item-highlight nil)

          (defun magit-commit-mode-init ()
            (when (looking-at "\n")
              (open-line 1)))

          (add-hook 'git-commit-mode-hook 'magit-commit-mode-init)
          ;; close popup when commiting
          (defadvice git-commit-commit (after delete-window activate)
            (message "Runnign post commit hooks")
            (message (shell-command-to-string (concat "sh " (magit-git-dir) "hooks/log_commits")))
            (delete-window))))



(provide 'init-magit)
