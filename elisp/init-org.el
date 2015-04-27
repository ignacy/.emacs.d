(use-package org
  :ensure org
  :init (progn
          ;; ;;;; ORG mode
          (setq org-return-follows-link t)
          (setq org-directory "~/Dropbox/notes")
          (setq org-default-notes-file (concat org-directory "/notes.org"))
          (setq org-default-todo-file (concat org-directory "/todo.org"))
          (setq org-default-book-notes-file (concat org-directory "/book_notes.org"))
          (setq org-upnext-file (concat org-directory "/upnext.org"))

          (define-key global-map "\C-cc" 'org-capture)
          (global-set-key (kbd "M-t") 'org-capture)
          (global-set-key "\C-cl" 'org-store-link)
          (global-set-key (kbd "<f12>") 'org-agenda)
          (global-set-key "\C-cb" 'org-iswitchb)

          (setq org-agenda-files '("~/Dropbox/notes"))

          ;;(setq org-agenda-files (quote (org-default-todo-file org-default-notes-file)))

          (setq org-capture-templates
                '(("t" "Todo" entry (file org-default-todo-file "Tasks")
                   "* TODO %?\n  %i\n ")
                  ("u" "Upnext" entry (file org-upnext-file)
                   "* %?\n  %i\n ")
                  ("p" "Plan" entry (file org-default-notes-file "Plans")
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

;; (require 'appt)
;; (setq appt-time-msg-list nil)    ;; clear existing appt list
;; (setq appt-display-interval '10) ;; warn every 10 minutes from t - appt-message-warning-time
;; (setq
;;   appt-message-warning-time '10  ;; send first warning 10 minutes before appointment
;;   appt-display-mode-line nil     ;; don't show in the modeline
;;   appt-display-format 'window)   ;; pass warnings to the designated window function
;; (appt-activate 1)                ;; activate appointment notification
;; (display-time)                   ;; activate time display

;; (org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
;; (run-at-time "24:01" 3600 'org-agenda-to-appt)           ;; update appt list hourly
;; (add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view

;; (defun my-appt-send-notification (title msg)
;;   (shell-command (concat "/usr/local/bin/terminal-notifier" " -message " msg " -title " title)))

;; ;; designate the window function for my-appt-send-notification
;; (defun my-appt-display (min-to-app new-time msg)
;;   (my-appt-send-notification
;;     (format "'Appointment in %s minutes'" min-to-app)    ;; passed to -title in terminal-notifier call
;;     (format "'%s'" msg)))                                ;; passed to -message in terminal-notifier call
;; (setq appt-disp-window-function (function my-appt-display))

(provide 'init-org)
