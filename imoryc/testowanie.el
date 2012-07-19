(defun show-full-spec-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (kill-new (concat "bex rspec --drb --color " (file-truename buffer-file-name))))

(defun run-current-spec ()
  (interactive)
  (show-full-spec-name)
  (switch-to-buffer "zsh")
  (autopair-newline)
  (goto-char (point-max))
  (yank)
  (autopair-newline))

