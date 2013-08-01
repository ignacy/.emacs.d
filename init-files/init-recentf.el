(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
;; enable recent files mode.
(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 200)
(add-to-list 'recentf-exclude "\\.revive\\'")

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  ;;(if (find-file (grizzl-completing-read "Recent file: " (grizzl-make-index recentf-list)))

  (if (find-file (ido-completing-read "Recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(provide 'init-recentf)
