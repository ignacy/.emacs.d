(use-package org
  :init (progn
          (require 'ox-md nil t)

          (setq org-todo-keywords
                '((sequence "TODO" "INPROGRESS" "WAITING" "|" "DONE" "CANCELED")))

          (setq-default im-notes-dir (expand-file-name (concat im-synched-dir "org/")))
          (setq-default org-default-notes-file (concat im-notes-dir "notes.org"))
          (setq-default org-agenda-files (list "~/Dropbox/org"))
          (setq org-agenda-text-search-extra-files '(agenda-archives))
          (setq org-enforce-todo-dependencies t)
          (setq org-blank-before-new-entry (quote ((heading) (plain-list-item))))
          (setq org-log-done (quote time))
          (setq org-log-reschedule (quote time))
          (setq org-log-redeadline (quote time))


          (defun add-pcomplete-to-capf ()
            (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

          (add-hook 'org-mode-hook #'add-pcomplete-to-capf)

          (setq org-use-speed-commands t
                org-hide-emphasis-markers t
                org-src-fontify-natively t   ;; Pretty code blocks
                org-fontify-whole-heading-line t
                org-src-tab-acts-natively t
                org-confirm-babel-evaluate nil)

          (setq org-capture-templates
                (quote
                 (("t" "todo" entry (file org-default-notes-file) "* TODO %?\n")
                  ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org") "* %?\n %U\n  %i\n  %a")
                  ("n" "note" entry (file org-default-notes-file) "* %? :NOTE:\n"))))


          (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
          (setq org-refile-use-outline-path 'file)
          (setq org-outline-path-complete-in-steps nil)
          (setq org-refile-allow-creating-parent-nodes 'confirm)

          (defun org-summary-todo (n-done n-not-done)
            "Switch entry to DONE when all subentries are done, to TODO otherwise."
            (let (org-log-done org-log-states)   ; turn off logging
              (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

          (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


          (defun air-org-skip-subtree-if-priority (priority)
            "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
            (let ((subtree-end (save-excursion (org-end-of-subtree t)))
                  (pri-value (* 1000 (- org-lowest-priority priority)))
                  (pri-current (org-get-priority (thing-at-point 'line t))))
              (if (= pri-value pri-current)
                  subtree-end
                nil)))

          (setq org-agenda-custom-commands
                '(("c" "Simple agenda view"
                   ((tags "PRIORITY=\"A\""
                          ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                           (org-agenda-overriding-header "High-priority unfinished tasks:")))
                    (agenda "")
                    (alltodo ""
                             ((org-agenda-skip-function
                               '(or (air-org-skip-subtree-if-priority ?A)
                                    (org-agenda-skip-if nil '(scheduled deadline))))))))))



          (setq org-fontify-done-headline t)
          (custom-set-faces
           '(org-done ((t (:foreground "PaleGreen"
                                       :weight normal
                                       :strike-through t))))
           '(org-headline-done
             ((((class color) (min-colors 16) (background dark))
               (:foreground "LightYellow4" :strike-through t)))))

          (defun air-pop-to-org-agenda (&optional split)
            "Visit the org agenda, in the current window or a SPLIT."
            (interactive "P")
            (org-agenda nil "c")
            (when (not split)
              (delete-other-windows)))
          (global-set-key (kbd "<f2>") 'air-pop-to-org-agenda)


          (set-face-attribute 'org-level-1 nil :weight 'bold)
          (set-face-attribute 'org-level-2 nil :weight 'bold)
          (set-face-attribute 'org-level-3 nil :weight 'bold)
          (set-face-attribute 'org-level-4 nil :weight 'bold)
          (font-lock-add-keywords
           nil
           '(("\(\+begin_src\)"
              (0 (progn (compose-region (match-beginning 1) (match-end 1) ?¦)
                        nil)))
             ("\(\+end_src\)"
              (0 (progn (compose-region (match-beginning 1) (match-end 1) ?¦)
                        nil)))))

          (font-lock-add-keywords 'org-mode
                                  '(("^ +\\([-*]\\) "
                                     (0 (prog1 ()
                                          (compose-region (match-beginning 1) (match-end 1) "•"))))))

          (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
          (global-set-key "\C-cl" 'org-store-link)
          (global-set-key (kbd "C-c C-c") 'org-capture)
          (global-set-key (kbd "C-c c") 'org-capture)
          (global-set-key "\C-ca" 'org-agenda)))

(use-package org-bullets
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'im-org-setup)
