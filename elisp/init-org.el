;; ;;;; ORG mode
(setq org-return-follows-link t)
(setq org-directory "~/Dropbox/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-todo-file (concat org-directory "/todo.org"))
(setq org-default-bug-journal-file (concat org-directory "/tickets.org"))
(setq org-default-book-notes-file (concat org-directory "/book_notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-files '("~/Dropbox/notes"))

;;(setq org-agenda-files (quote (org-default-todo-file org-default-notes-file)))

(setq org-capture-templates
      '(("t" "Todo" entry (file org-default-todo-file "Tasks")
         "* TODO %?\n  %i\n ")
        ("b" "Bug/Tickets Journal" entry (file org-default-bug-journal-file)
         "* %^{Description}\n %?\n on %U\n  %i\n  ")
        ("o" "Book note" entry (file org-default-book-notes-file)
         "* %^{Book title}\n %?\n")
        ("n" "Note" entry (file org-default-notes-file)
         "* %^{Title}\n %?\non %U\n  %i\n  ")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))



;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

(setq org-use-fast-todo-selection t)

(setq make-backup-files nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)
   (java . t)
   (scala . t)
   (ruby . t)))

(provide 'init-org)
