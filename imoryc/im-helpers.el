;; Moje funkcje

(defun im/find-note (note)
  "Find note in org mode notes file"
  (find-file "/home/ignacy/Dropbox/org/notes.org")
  (re-search-forward note))
