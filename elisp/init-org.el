;; ;;;; ORG mode
(setq org-return-follows-link t)
(setq org-directory "~/Dropbox/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-todo-file (concat org-directory "/todo.org"))
(setq org-default-bug-journal-file (concat org-directory "/tickets.org"))
(setq org-default-book-notes-file (concat org-directory "/book_notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file org-default-todo-file "Tasks")
         "* TODO %?\n  %i\n ")
        ("b" "Bug/Tickets Journal" entry (file+datetree org-default-bug-journal-file)
         "* %?\nEntered on %U\n  %i\n  ")
        ("o" "Book note" entry (file org-default-book-notes-file)
         "* %^{Book title}\n %?\n")
        ("n" "Note" entry (file+datetree org-default-notes-file)
         "* %?\nEntered on %U\n  %i\n  ")))

(setq make-backup-files nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)
   (java . t)
   (scala . t)
   (ruby . t)))

(provide 'init-org)
