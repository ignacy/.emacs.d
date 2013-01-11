(require 'org)
(setq org-directory "~/Dropbox/notes")
(setq org-default-notes-file "~/Dropbox/notes/notes.org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/notes/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %i\n  %a")))
(setq org-agenda-files (quote ("~/Dropbox/notes/deft")))
(setq org-clock-persist 'history)
(setq org-src-fontify-natively t)
(setq org-refile-use-outline-path 'file)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((ruby . t) (R . t)))
(setq org-refile-targets '((org-agenda-files . (:level . 1))))
(org-clock-persistence-insinuate)
(define-key global-map "\C-cc" 'org-capture)

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
