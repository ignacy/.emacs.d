(defun extract-method (name start end)
  (interactive (list (read-string "Function name to create: ")
                     (region-beginning) (region-end)))
  (let ((snip (buffer-substring start end)))
    (delete-region start end)
    (save-excursion
      (insert (format "%s\n" name))
      (search-forward "def" nil t) ;; word limit noerror
      (backward-word)
      (insert (format "def %s\n" name))
      (insert snip)
      (insert "end\n"))))

(provide 'ruby-refactoring)
