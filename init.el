(require 'defaults) ;; Things that seldom change

(use-package ido-occur
  :bind (("C-c o" . ido-occur)))
(use-package graphql-mode)
(use-package es-mode)
(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)))
(use-package ruby-test-mode)
(use-package flycheck
  ;;:config (setq-default flycheck-disabled-checkers '(ruby-reek))
  :init (global-flycheck-mode t))

(define-key ctl-x-map "\C-i" #'endless/ispell-word-then-abbrev)
(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
sabort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (thing-at-point 'word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word))
      (setq aft (thing-at-point 'word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(use-package dockerfile-mode
  :init (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;; (use-package rspec-mode
;;   :config (progn
;;             (setq rspec-use-rake-when-possible nil)
;;             (setq rspec-use-rvm nil)
;;             (setq rspec-use-bundler-when-possible 't)
;;             (add-hook 'ruby-mode-hook 'rspec-verifiable-mode)))

(use-package smart-jump
  :ensure t
  :bind (("C-M-." . 'smart-jump-go))
  :config
  (smart-jump-setup-default-registers))

(use-package coffee-mode
  :config (custom-set-variables '(coffee-tab-width 2))
  :init (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode)))

(use-package json-mode)
(use-package js2-mode
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
          (setq-default js2-basic-offset 4)
          (setq-default js-indent-level 4)))

(use-package haml-mode)
(use-package slim-mode)

;; (use-package go-mode
;;   :config (progn
;;             (add-hook 'go-mode-hook '(lambda ()
;;                                        (setq gofmt-command "goimports")
;;                                        (local-set-key (kbd "C-c C-f") 'gofmt)
;;                                        (local-set-key (kbd "C-c C-k") 'godoc)
;;                                        (setq tab-width 4)
;;                                        (setq indent-tabs-mode 1)))
;;             (add-hook 'before-save-hook 'gofmt-before-save)))

(use-package ag
  :bind (("C-c r" . ag-files)
         ("M-r" . ag-regexp-project-at-point)))

(global-set-key (kbd "M-c") 'query-replace-regexp)

(use-package anzu
  :init (progn (global-anzu-mode +1)
               (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)))

(use-package keyfreq
  :init (progn (keyfreq-mode 1)
               (keyfreq-autosave-mode 1)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(use-package yasnippet
  :init (yas-global-mode 1))
(use-package symbol-overlay
  :init (progn
          (add-hook 'prog-mode-hook 'symbol-overlay-mode)
          (global-set-key (kbd "M-i") 'symbol-overlay-put)
          (global-set-key (kbd "M-o") 'symbol-overlay-remove-all)))
(use-package wrap-region
  :init (progn
          (wrap-region-global-mode +1)
          (wrap-region-add-wrapper "`" "`")
          (wrap-region-add-wrapper "{" "}")))

(use-package expand-region
  :defer t
  :bind ("M-2" . er/expand-region))

(use-package magit
  :config (progn
            (setq magit-process-popup-time 1)
            (magit-add-section-hook 'magit-status-sections-hook
                                    'magit-insert-unpushed-to-upstream
                                    'magit-insert-unpushed-to-upstream-or-recent
                                    'replace)
            (setq magit-completing-read-function 'ido-completing-read))
  :init (progn
          (defun im/magit-soft-reset-head~1 ()
            "Undo last commit (soft)"
            (interactive)
            (magit-reset-soft "HEAD~1"))

          (global-set-key (kbd "<escape> g") 'magit-status)
          (global-set-key (kbd "C-x g") 'magit-status)))

(use-package hierarchy)
(use-package json-navigator)

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(setq dired-auto-revert-buffer t    ; Revert on re-visiting
      dired-listing-switches "-alhF"
      dired-ls-F-marks-symlinks t   ; -F marks links with @
      dired-recursive-copies 'always
      dired-dwim-target t)

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))

(global-set-key (kbd "C-c n") 'indent-region-or-buffer)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t p") 'transpose-params)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t w") 'transpose-words)

(use-package iedit)
(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(global-set-key (kbd "M-z") 'undo)
(setq column-number-mode t)
(setq shell-file-name "zsh")
(setenv "SHELL" shell-file-name)

(use-package which-key :init (which-key-mode))

(use-package recentf
  :init (progn
          (setq recentf-auto-cleanup 'never)
          (recentf-mode t)
          (setq recentf-max-saved-items 2000)
          (setq recentf-max-menu-items 10)
          (setq recentf-auto-cleanup 'never);; disable before we start recentf! If using Tramp a lot.
          (setq recentf-exclude (list "/\\.git/.*\\'" ; Git contents
                                      "/elpa/.*\\'" ; Package files
                                      "TAGS"
                                      "/itsalltext/" ; It's all text temp files
                                      ;; And all other kinds of boring files
                                      #'ignoramus-boring-p))))
(defun ido-recentf-open ()
  "Use `ido-completing-read' to find a recent file."
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(use-package avy :bind (("C-:" . avy-goto-char)))

(defun endless/fill-or-unfill ()
  "Like `fill-paragraph', but unfill if used twice."
  (interactive)
  (let ((fill-column
         (if (eq last-command 'endless/fill-or-unfill)
             (progn (setq this-command nil)
                    (point-max))
           fill-column)))
    (call-interactively #'fill-paragraph)))

(global-set-key [remap fill-paragraph] #'endless/fill-or-unfill)
(put 'narrow-to-region 'disabled nil)

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

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

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (use-package all-the-icons-dired
    ;; M-x all-the-icons-install-fonts
    :ensure t
    :commands (all-the-icons-dired-mode)))

(use-package ibuffer-vc
  :init (add-hook 'ibuffer-hook
                  (lambda ()
                    (ibuffer-vc-set-filter-groups-by-vc-root)
                    (unless (eq ibuffer-sorting-mode 'alphabetic)
                      (ibuffer-do-sort-by-alphabetic)))))

(global-set-key (kbd "C-c d") 'cd)
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key (kbd "<f5>") 'bookmark-jump)


(use-package jekyll-modes)
(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.liquid" . jekyll-html-mode))
(use-package yaml-mode)


(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(global-set-key (kbd "C-]") 'rotate-windows)
;; Move windows, even in org-mode
(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

(defun system-is-imac ()
  (interactive)
  (string-equal system-name "iMac-Ignacy.local"))

(defun readable-and-clear ()
  "Set large font and disables the theme. (presentation mode)"
  (interactive)
  (disable-all-themes)
  (set-frame-font "Monaco 18"))

;; (use-package challenger-deep-theme)
;; (load-theme 'challenger-deep t)
;; (use-package hemera-theme
;;   :init (load-theme 'hemera t))
;; (use-package anti-zenburn-theme
;;   :init (load-theme 'anti-zenburn t))

(load-theme 'meacupla t)

;; (use-package exotica-theme
;;   :init (load-theme 'exotica t))
;; (use-package rebecca-theme
;;   :init (load-theme 'rebecca t))
;; (use-package github-modern-theme
;;   :init (load-theme 'github-modern t))
;;(load-theme 'awemacs t)
;; (use-package sexy-monochrome-theme
;;   :init (load-theme 'sexy-monochrome t))
;; (use-package kaolin-themes
;;   :init (load-theme 'kaolin-tribal t))

(if (system-is-imac)
    (set-default-font "Hack 16")
  (set-default-font "Hack 14"))

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
