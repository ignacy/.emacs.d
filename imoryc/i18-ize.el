(defun im/replace-space-with-underscore (start end)
  (interactive "r")
  (save-excursion
    (goto-char start)
    (while (re-search-forward " " nil t)
      (replace-match "_"))))


(defun im/to-namespace (p1 p2)
  (interactive "r")
  (downcase-region p1 p2)
  (im/replace-space-with-underscore p1 p2))


