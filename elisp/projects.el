;;; projects.el

(setq projects '("data_collector" "locator"))

(defun switch-project ()
  "Switch to project"
  (interactive)
  (let ((project (completing-read "Which project?: " projects)))
    (cd (concat "~/code/" project))
    (persp-new project)
    (find-file-in-project) ) )

(provide 'projects)
