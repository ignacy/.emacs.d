(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq im-synched-dir "~/Dropbox/")

(setq use-package-always-ensure t)
(require 'use-package)

(global-auto-revert-mode 1)
(setq inhibit-startup-message 't)
(setq tags-add-tables nil)
(set-default 'truncate-lines t)
(setq tags-revert-without-query 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(delete-selection-mode t)
(setq dotfiles-dir "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq mac-command-modifier 'meta)
(save-place-mode 1)

(use-package exec-path-from-shell
  :init (progn
          (setq exec-path-from-shell-arguments '("-l"))
          (exec-path-from-shell-initialize)
          (exec-path-from-shell-copy-env "GOPATH")
          (exec-path-from-shell-copy-env "PATH")))

(use-package company
  :init (progn
          (setq company-dabbrev-downcase nil)
          (setq company-dabbrev-ignore-case nil)
          (global-company-mode t)))

(setq abbrev-file-name (concat dotfiles-dir "abbrevations"))
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(set-default 'imenu-auto-rescan t)
(global-set-key (kbd "M-\\") 'imenu)

(use-package py-yapf
  :init (add-hook 'python-mode-hook 'py-yapf-enable-on-save))

(use-package flx-ido
  :init (progn
          (flx-ido-mode 1)
          ;; disable ido faces to see flx highlights.
          (setq ido-enable-flex-matching t)
          (setq ido-use-faces nil)))

(global-set-key (kbd "M-/") 'hippie-expand)

(use-package ruby-mode
  :init (progn
          (add-hook 'ruby-mode-hook
                    (lambda ()
                      (subword-mode 1)
                      ))))

(use-package inf-ruby)

(defconst inf-ruby-prompt-format-custom
  (concat
   (mapconcat
    #'identity
    '("\\(^%s> *\\)"
      "\\(^(byebug) *\\)"
      "\\(^\\(irb([^)]+)"
      "\\([[0-9]+] \\)?.*([^)]+)" ; pry fix
      "\\(jruby-\\|JRUBY-\\)?[1-9]\\.[0-9]\\.[0-9]+\\(-?p?[0-9]+\\)?"
      "^rbx-head\\)")
    "\\|")
   " ?[0-9:]* ?%s *\\)")
  "Format string for the prompt regexp pattern.")

(setq inf-ruby-first-prompt-pattern
      (format inf-ruby-prompt-format-custom ">" ">"))
(setq inf-ruby-prompt-pattern
      (format inf-ruby-prompt-format-custom "[?>]" "[\]>*\"'/`]"))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren '(?\[ ?\] t))
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

(use-package rubocop
  :init (define-key ruby-mode-map (kbd "C-c C-f") 'rubocop-autocorrect-current-file))

(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (ignore-errors (global-rbenv-mode))))

(use-package flycheck
  :config (setq-default flycheck-disabled-checkers '(ruby-reek))
  :init (global-flycheck-mode t))

(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)

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

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

(use-package flyspell-popup
  :init (global-set-key (kbd "C-:") #'flyspell-popup-correct))

;;(add-hook 'prog-mode-hook 'eldoc-mode)

(use-package dockerfile-mode
  :init (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package rspec-mode
  :config (progn
            (setq rspec-use-rake-when-possible nil)
            (setq rspec-use-rvm nil)
            (setq rspec-use-bundler-when-possible 't)
            (add-hook 'ruby-mode-hook 'rspec-verifiable-mode)
            ;; (eval-after-load 'rspec-mode
            ;;   '(rspec-install-snippets))
            ;;(setq rspec-command-options "--format progress --order random")
            ))

(use-package dumb-jump
  :bind (("C-M-." . dumb-jump-go-other-window))
  :config (progn
            (setq dumb-jump-force-searcher 'ag)
            (setq dumb-jump-selector 'ivy)))

(use-package coffee-mode
  :config (custom-set-variables '(coffee-tab-width 2))
  :init (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode)))

(use-package js2-mode
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
          (setq-default js2-basic-offset 4)
          (setq-default js-indent-level 4)
          (setq-default js2-mode-indent-ignore-first-tab t)
          (setq-default js2-show-parse-errors nil)
          (setq-default js2-strict-inconsistent-return-warning nil)
          (setq-default js2-strict-var-hides-function-arg-warning nil)
          (setq-default js2-strict-missing-semi-warning nil)
          (setq-default js2-strict-trailing-comma-warning nil)
          (setq-default js2-strict-cond-assign-warning nil)
          (setq-default js2-strict-var-redeclaration-warning nil)
          (setq-default js2-global-externs
                        '("module" "require" "__dirname" "process" "console" "define"
                          "JSON" "$" "_" "Backbone" ))))
(use-package haml-mode)
(use-package slim-mode)

(use-package go-mode
  :config (progn
            (add-hook 'go-mode-hook '(lambda ()
                                       ;; (set (make-local-variable 'company-backends) '(company-go))
                                       ;; (company-mode)

                                       (setq gofmt-command "goimports")

                                       (local-set-key (kbd "C-c C-f") 'gofmt)
                                       (local-set-key (kbd "C-c C-k") 'godoc)
                                       (setq tab-width 4)
                                       (setq indent-tabs-mode 1)
                                       ))
            (add-hook 'before-save-hook 'gofmt-before-save)
            ))

(ignore-errors (require 'go-flycheck))


(use-package find-file-in-project)
(global-set-key (kbd "C-x C-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'find-file)

(use-package ag
  :config (progn
            (global-set-key (kbd "C-c r") 'ag-files)
            (global-set-key (kbd "M-r") 'ag-regexp-project-at-point)))

(global-set-key (kbd "M-c") 'query-replace-regexp)

(use-package anzu
  :init (progn (global-anzu-mode +1)
               (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)))

(use-package keyfreq
  :init (progn (keyfreq-mode 1)
               (keyfreq-autosave-mode 1)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

;;(use-package github-modern-theme)

(use-package auto-yasnippet
  :init (progn
          (global-set-key (kbd "C-c s") #'aya-create)
          (global-set-key (kbd "C-c i") #'aya-expand)))

(use-package yasnippet
  :init (yas-global-mode 1))

(setq-default mode-line-format
              (list
               '(:eval (propertize "%* " 'face font-lock-warning-face))

               ;; value of current buffer name
               "%b, "
               '(vc-mode vc-mode)

               " (%l %c) "
               ))

(setq-default display-line-numbers 't)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq kill-ring-max 200                 ; More killed items
      kill-do-not-save-duplicates t     ; No duplicates in kill ring
      ;; Save the contents of the clipboard to kill ring before killing
      save-interprogram-paste-before-kill t)

;; (use-package highlight-symbol
;;   :init (progn
;;           (add-hook 'prog-mode-hook 'highlight-symbol-mode)
;;           (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
;;           (setq highlight-symbol-idle-delay 0)))

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
            (setq magit-completing-read-function 'ivy-completing-read))
  :init (progn
          (defun im/magit-soft-reset-head~1 ()
            "Undo last commit (soft)"
            (interactive)
            (magit-reset-soft "HEAD~1"))

          (global-set-key (kbd "<escape> g") 'magit-status)
          (global-set-key (kbd "C-x g") 'magit-status)))

(use-package github-browse-file
  :init (global-set-key (kbd "C-c g") 'github-browse-file))

(global-set-key (kbd "C-<tab>") (lambda () (interactive) (switch-to-buffer (other-buffer (current-buffer) 1))))
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))

(defun join-lines (arg)
  (interactive "p")
  (end-of-line)
  (delete-char 1)
  (delete-horizontal-space)
  (insert " "))

(global-set-key (kbd "M-j") 'join-lines)

(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a `before-save-hook`, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(add-hook 'before-save-hook 'cleanup-buffer-safe)

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

(global-set-key (kbd "C-x i") 'indent-region-or-buffer)

(use-package iedit)

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(global-set-key (kbd "M-z") 'undo)

(setq column-number-mode t)
(setq shell-file-name "zsh")
(setenv "SHELL" shell-file-name)

(use-package which-key
  :init (which-key-mode))

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
                                      #'ignoramus-boring-p))
          ))

(global-set-key (kbd "C-x C-r") 'counsel-recentf)

(use-package avy
  :init (global-set-key (kbd "C-:") 'avy-goto-char))

(use-package ivy
  :init (progn
          (ivy-mode 1)
          (setq ivy-use-virtual-buffers t)
          (setq enable-recursive-minibuffers t)
          (global-set-key "\C-s" 'swiper)
          (global-set-key (kbd "C-c C-r") 'ivy-resume)
          (global-set-key (kbd "M-x") 'counsel-M-x)
          (global-set-key (kbd "C-x C-f") 'counsel-find-file)
          (global-set-key (kbd "C-c j") 'counsel-git-grep)
          (global-set-key (kbd "C-c k") 'counsel-ag)
          (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))


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

          ;;(global-set-key (kbd "<f5>") (lambda() (interactive) (find-file "~/Dropbox/org/journal.org")))

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

          (font-lock-add-keywords 'org-mode
                                  '(("^ +\\([-*]\\) "
                                     (0 (prog1 ()
                                          (compose-region (match-beginning 1) (match-end 1) "•"))))))

          (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
          (global-set-key "\C-cl" 'org-store-link)
          (global-set-key (kbd "<f5>") 'org-capture)
          (global-set-key (kbd "C-c C-c") 'org-capture)
          (global-set-key (kbd "C-c c") 'org-capture)
          (global-set-key "\C-ca" 'org-agenda)))

(use-package org-bullets
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key (kbd "C-h") 'delete-backward-char)

(use-package eterm-256color
  :ensure t)

(use-package jekyll-modes)
(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.liquid" . jekyll-html-mode))
(use-package yaml-mode)

(add-hook 'term-mode-hook #'eterm-256color-mode)

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

;; (use-package exotica-theme
;;   :init (load-theme 'exotica t))

(use-package rebecca-theme
  :init (load-theme 'rebecca t))

;; (use-package sexy-monochrome-theme
;;    (load-theme 'sexy-monochrome t))

;; (use-package kaolin-themes
;;   :init (load-theme 'kaolin-tribal t))

(if (system-is-imac)
    (set-default-font "Monaco 16")
  (set-default-font "Monaco 14"))

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
