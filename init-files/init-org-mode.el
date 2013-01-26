(require 'org)


(setq org-directory "~/Dropbox/notes")
(setq org-default-notes-file "~/Dropbox/notes/notes.org")
(setq org-default-tasks-file "~/Dropbox/notes/todo.org")


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-tasks-file "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("r" "Reading Log" entry (file+headline org-default-notes-file "Reading Log")
             "* %?\nEntered on %U\n  %i\n  %a")))

(setq org-agenda-files (quote ("~/Dropbox/notes/deft" "~/Dropbox/notes/todo.org")))

(setq org-clock-persist 'history)
(setq org-src-fontify-natively t)
(setq org-refile-use-outline-path 'file)


;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((ruby . t) (R . t)))

(setq org-refile-targets '((org-agenda-files . (:level . 1))))
(org-clock-persistence-insinuate)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-fontify-done-headline t)
(custom-set-faces
 '(org-done ((t (:foreground "PaleGreen"
                             :weight normal
                             :strike-through t))))
 '(org-headline-done
   ((((class color) (min-colors 16) (background dark))
     (:foreground "LightSalmon" :strike-through t)))))

(add-to-list 'load-path (concat dotfiles-dir "/deft"))

(require 'deft)
(setq deft-use-filename-as-title t)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-auto-save-interval 2.3)
(setq deft-directory "~/Dropbox/notes/deft/")

(provide 'init-org-mode)
