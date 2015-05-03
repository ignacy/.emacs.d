(use-package org
  :ensure org
  :init (progn
          ;; ;;;; ORG mode
          (setq org-return-follows-link t)
          (setq org-directory "~/Dropbox/notes")
          (setq org-default-notes-file (concat org-directory "/notes.org"))
          (setq org-default-todo-file (concat org-directory "/todo.org"))
          (setq org-default-plans-file (concat org-directory "/plans.org"))
          (setq org-default-book-notes-file (concat org-directory "/book_notes.org"))
          (setq org-upnext-file (concat org-directory "/upnext.org"))

          (define-key global-map "\C-cc" 'org-capture)
          (global-set-key (kbd "M-t") 'org-capture)
          (global-set-key "\C-cl" 'org-store-link)
          (global-set-key (kbd "<f12>") 'org-agenda)
          (global-set-key "\C-cb" 'org-iswitchb)
          (global-set-key (kbd "C-c t") 'org-todo-list)

          (setq org-agenda-files '("~/Dropbox/notes"))

          ;;(setq org-agenda-files (quote (org-default-todo-file org-default-notes-file)))

          (setq org-capture-templates
                '(("t" "Todo" entry (file org-default-todo-file "Tasks")
                   "* TODO %?\n  %i\n ")
                  ("u" "Upnext" entry (file org-upnext-file)
                   "* %?\n  %i\n ")
                  ("p" "Plan" entry (file org-default-plans-file "Plans")
                   "* %?\n  %i\n ")
                  ("b" "Book note" entry (file org-default-book-notes-file)
                   "* %^{Book title}\n %?\n")
                  ("n" "Note" entry (file org-default-notes-file)
                   "* %?\n %i\n  ")))

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
             (ruby . t)))))

;; (defun my/org-agenda-done (&optional arg)
;;   "Mark current TODO as done.
;; This changes the line at point, all other lines in the agenda referring to
;; the same tree node, and the headline of the tree node in the Org-mode file."
;;   (interactive "P")
;;   (org-agenda-todo "DONE"))
;; ;; Override the key definition for org-exit
;; (define-key org-agenda-mode-map "x" 'my/org-agenda-done)

(provide 'init-org)
