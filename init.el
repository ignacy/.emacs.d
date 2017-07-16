(package-initialize)

(load-library "url-handlers")
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq im-synched-dir "~/SpiderOakHive/")

(setq use-package-always-ensure t)
(require 'use-package)

(setq inhibit-startup-message 't)
(setq tags-add-tables nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
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

(setq compilation-scroll-output nil)
(setq compilation-error-regexp-alist nil)
(setq compilation-error-regexp-alist-alist nil)

(use-package exec-path-from-shell
  :init (progn
          (setq exec-path-from-shell-arguments '("-l"))
          (exec-path-from-shell-initialize)
          (exec-path-from-shell-copy-env "GOPATH")
          (exec-path-from-shell-copy-env "PATH")))

(use-package bug-hunter)
(use-package feature-mode)

(use-package company
  :init (progn
          (setq company-dabbrev-downcase nil)
          (setq company-dabbrev-ignore-case nil)
          (global-company-mode t)))

;; (use-package company-go)
(setq abbrev-file-name (concat dotfiles-dir "abbrevations"))
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(use-package ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)

(use-package ido-ubiquitous
  :init (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  :init (progn
          (ido-vertical-mode 1)
          (setq ido-vertical-define-keys 'C-n-and-C-p-only)))

(setq ido-create-new-buffer 'always)

(set-default 'imenu-auto-rescan t)
(global-set-key (kbd "M-\\") 'imenu)

(use-package flx-ido
  :init (progn
          (flx-ido-mode 1)
          ;; disable ido faces to see flx highlights.
          (setq ido-enable-flex-matching t)
          (setq ido-use-faces nil)))

(global-set-key (kbd "M-/") 'hippie-expand)

(use-package elixir-mode)
(use-package alchemist)

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

;;(eval-after-load 'inf-ruby)
;; '(define-key inf-ruby-minor-mode-map (kbd "C-c C-c") 'inf-ruby-console-rails))
(add-hook 'after-init-hook 'inf-ruby-switch-setup)


(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren '(?\[ ?\] t))
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

(use-package ruby-hash-syntax)

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

(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(use-package flyspell-popup
  :init (global-set-key (kbd "C-:") #'flyspell-popup-correct))

;;(add-hook 'prog-mode-hook 'eldoc-mode)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(use-package dockerfile-mode
  :init (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package rspec-mode
  :config (progn
            (setq rspec-use-rake-when-possible nil)
            (setq rspec-use-rvm nil)
            (setq rspec-use-bundler-when-possible nil)
            (add-hook 'ruby-mode-hook 'rspec-verifiable-mode)
            ;; (eval-after-load 'rspec-mode
            ;;   '(rspec-install-snippets))
            ;;(setq rspec-command-options "--format progress --order random")
            ))

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

(use-package ag
  :config (progn
            (global-set-key (kbd "C-c r") 'ag-files)
            (global-set-key (kbd "M-r") 'ag-project)))

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

(setq-default mode-line-format
              (list
               '(:eval (propertize "%* " 'face font-lock-warning-face))

               ;; value of current buffer name
               "%b, "
               '(vc-mode vc-mode)

               " (%l %c) "
               ))

;;(use-package github-modern-theme)
;;(load-theme 'dakrone-light t)
;;(load-theme 'nord t)
;;(use-package kaolin-theme)
(load-theme 'kaolin t)
(use-package sml-mode)

(use-package slime
  :config (progn
            (load (expand-file-name "~/quicklisp/slime-helper.el"))
            ;; Replace "sbcl" with the path to your implementation
            (setq inferior-lisp-program "/usr/local/bin/sbcl")
            (slime-setup '(slime-fancy slime-tramp slime-asdf))
            (slime-require :swank-listener-hooks))
  )


(setq tags-revert-without-query 1)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package projectile-rails)
(use-package projectile
  :init
  (progn
    (defadvice find-tag-at-point (before auto-visti-tags)
      "Load default TAGS file from home directory if needed"
      (visit-tags-table (concat (projectile-project-root) "TAGS")))
    (ad-activate 'find-tag-at-point)

    (setq projectile-sort-order 'recentf)
    (setq projectile-completion-system 'ido)
    (projectile-global-mode)
    (add-hook 'projectile-mode-hook 'projectile-rails-on))

  :config
  (progn
    (setq projectile-switch-project-action 'projectile-dired)
    (add-to-list 'projectile-globally-ignored-files ".DS_Store"))
  :bind ("C-c C-p" . projectile-switch-project))


(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c m") 'projectile-rails-find-current-spec)

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
            (setq magit-completing-read-function 'ido-completing-read))
  :init (progn
          (global-set-key (kbd "<escape> g") 'magit-status)
          (global-set-key (kbd "C-x g") 'magit-status)))
(global-auto-revert-mode 1)

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

;; (use-package recentf
;;   :init (progn
;;           (setq recentf-auto-cleanup 'never)
;;           (recentf-mode t)
;;           (setq recentf-max-saved-items 2000)
;;           (setq recentf-max-menu-items 10)
;;           (setq recentf-auto-cleanup 'never);; disable before we start recentf! If using Tramp a lot.
;;           (setq recentf-exclude (list "/\\.git/.*\\'" ; Git contents
;;                                       "/elpa/.*\\'" ; Package files
;;                                       "TAGS"
;;                                       "/itsalltext/" ; It's all text temp files
;;                                       ;; And all other kinds of boring files
;;                                       #'ignoramus-boring-p))
;;           ))

;; (defun recentf-ido-find-file ()
;;   "Find a recent file using ido."
;;   (interactive)
;;   (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
;;     (when file
;;       (find-file file))))

;; (global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)

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

;; (use-package rainbow-identifiers
;;   :init (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(global-set-key (kbd "M-z") 'undo)

(setq column-number-mode t)
(setq ispell-program-name "aspell")
(setq ispell-dictionary "american")
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

(setq shell-file-name "fish")
(setenv "SHELL" shell-file-name)

(use-package which-key
  :init (which-key-mode))

;; (use-package evil-leader
;;   :init (progn
;;          (global-evil-leader-mode)
;;          (evil-leader/set-leader ",")
;;          (evil-leader/set-key
;;            "b" 'switch-to-buffer
;;            "r" 'recentf-ido-find-file
;;            "f" 'projectile-find-file
;;            "w" 'save-buffer)))

;; (use-package evil
;;  :init (evil-mode t))

;; (define-key evil-normal-state-map "\C-y" 'yank)
;; (define-key evil-insert-state-map "\C-y" 'yank)
;; (define-key evil-visual-state-map "\C-y" 'yank)

;; (define-key evil-normal-state-map "\C-y" 'yank)
;; (define-key evil-insert-state-map "\C-y" 'yank)
;; (define-key evil-visual-state-map "\C-y" 'yank)

;; (fset 'evil-visual-update-x-selection 'ignore)

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

(use-package org-bullets
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq im-notes-dir (concat im-synched-dir "notes/"))

(use-package org
  :init (progn
          (require 'ox-md nil t)
          (defun add-pcomplete-to-capf ()
            (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

          (add-hook 'org-mode-hook #'add-pcomplete-to-capf)

          (setq org-use-speed-commands t
                org-hide-emphasis-markers t
                org-src-fontify-natively t   ;; Pretty code blocks
                org-fontify-whole-heading-line t
                org-src-tab-acts-natively t
                org-confirm-babel-evaluate nil)

          (setq org-default-notes-file (concat im-notes-dir "notes.org"))
          (setq org-capture-templates
                (quote
                 (("t" "todo" entry (file org-default-notes-file) "* TODO %?\n")
                  ("n" "note" entry (file org-default-notes-file) "* %? :NOTE:\n"))))

          (setq org-agenda-files '(im-notes-dir))

          (setq org-agenda-custom-commands
                '(("c" . "My Custom Agendas")
                  ("cu" "Unscheduled TODO"
                   ((todo ""
                          ((org-agenda-overriding-header "Unscheduled TODO")
                           (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp)))))
                   nil
                   nil)))

          (defun org-weekly-agenda ()
            (interactive)
            (org-agenda nil "cu"))

          (global-set-key (kbd "C-c t") 'org-weekly-agenda)

          (font-lock-add-keywords 'org-mode
                                  '(("^ +\\([-*]\\) "
                                     (0 (prog1 ()
                                          (compose-region (match-beginning 1) (match-end 1) "•"))))))
          (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
          (global-set-key "\C-cl" 'org-store-link)
          (global-set-key (kbd "C-c c") 'org-capture)
          (global-set-key (kbd "C-c C-c") 'org-capture)
          (global-set-key "\C-ca" 'org-agenda)))




(global-set-key (kbd "C-h") 'delete-backward-char)

(defun system-is-imac ()
  (interactive)
  (string-equal system-name "iMac-Ignacy.local"))

(if (system-is-imac)
    (set-frame-font "Source Code Pro Semibold-16")
  (add-to-list 'default-frame-alist '(font . "mononoki 16")))

(defun readable-and-clear ()
  "Set large font and disables the theme. (presentation mode)"
  (interactive)
  (disable-all-themes)
  (set-frame-font "Monaco 18"))

(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
