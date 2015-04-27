(use-package magit
  :ensure magit
  :init (progn

          (setq magit-last-seen-setup-instructions "1.4.0")
          (setq magit-completing-read-function 'magit-ido-completing-read)

          (add-hook 'git-commit-mode-hook 'magit-commit-mode-init)
          ;; close popup when commiting
          (defadvice git-commit-commit (after delete-window activate)
            (message "Runnign post commit hooks")
            (message (shell-command-to-string (concat "sh " (magit-git-dir) "hooks/log_commits")))
            (delete-window))

          ;; (set-face-foreground 'magit-diff-add "green3")
          ;; (set-face-foreground 'magit-diff-del "red3")
          ;; (when (not window-system)
          ;;   (set-face-background 'magit-item-highlight "black"))

          (global-set-key (kbd "C-x g") 'magit-status)
          ;; (add-hook 'magit-mode-hook (lambda () (setq truncate-lines nil)))

          (defun magit-commit-mode-init ()
            (when (looking-at "\n")
              (open-line 1)))

          ))


(defun whats-up ()
  (interactive)
  (term-run-shell-command "git whatchanged --since='1 day ago' -p"))


(provide 'init-magit)
