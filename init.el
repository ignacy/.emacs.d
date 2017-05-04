(package-initialize)

(load-library "url-handlers")
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

(setq inhibit-startup-message 't)
(setq tags-add-tables nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(0 . 0))
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(delete-selection-mode t)
(setq dotfiles-dir "~/.emacs.d/")

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

;; (use-package company
;;   :init (progn
;;           (setq company-dabbrev-downcase nil)
;;           (setq company-dabbrev-ignore-case nil)
;;           (global-company-mode t)

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

(eval-after-load 'inf-ruby
  '(define-key inf-ruby-minor-mode-map (kbd "C-c C-c") 'inf-ruby-console-rails))
(add-hook 'after-init-hook 'inf-ruby-switch-setup)


(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren '(?\[ ?\] t))
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

(use-package ruby-hash-syntax)

(use-package rubocop
  :init (define-key ruby-mode-map (kbd "C-c C-r") 'rubocop-autocorrect-current-file))

(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (ignore-errors (global-rbenv-mode))))


(use-package flycheck
  :init (global-flycheck-mode t))

(use-package dockerfile-mode
  :init (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package rspec-mode
  :ensure  rspec-mode
  :config (progn
            (setq rspec-use-rake-when-possible nil)
            (setq rspec-use-rvm nil)
            (setq rspec-use-bundler-when-possible nil)
            (add-hook 'ruby-mode-hook 'rspec-verifiable-mode)
            (eval-after-load 'rspec-mode
              '(rspec-install-snippets))
            ;;(setq rspec-command-options "--format progress --order random")
            ))

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
  "disable all active themes."
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

(load-theme 'kaolin t)

(setq tags-revert-without-query 1)

(use-package projectile-rails)
(use-package projectile
  :init (progn
          (defadvice find-tag-at-point (before auto-visti-tags)
            "Load default TAGS file from home directory if needed"
            (visit-tags-table (concat (projectile-project-root) "TAGS")))

          (setq projectile-completion-system 'ido)
          (setq projectile-enable-caching t)
          (ad-activate 'find-tag-at-point)
          (projectile-global-mode)
          (add-hook 'projectile-mode-hook 'projectile-rails-on))
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

(use-package highlight-symbol
  :init (progn
          (add-hook 'prog-mode-hook 'highlight-symbol-mode)
          (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
          (setq highlight-symbol-idle-delay 0)))

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
  :init (global-set-key (kbd "C-x g") 'magit-status))

(global-auto-revert-mode 1)

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

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-use)))))))

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

;; (use-package org-bullets
;;   :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (setq dropbox-notes-dir "~/Dropbox/notes/")

;; (use-package org
;;   :init (progn
;;           (require 'ox-md nil t)
;;           (defun add-pcomplete-to-capf ()
;;             (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))

;;           (add-hook 'org-mode-hook #'add-pcomplete-to-capf)

;;           (setq org-use-speed-commands t
;;                 org-hide-emphasis-markers t
;;                 org-src-fontify-natively t   ;; Pretty code blocks
;;                 org-fontify-whole-heading-line t
;;                 org-src-tab-acts-natively t
;;                 org-confirm-babel-evaluate nil)

;;           (setq org-default-notes-file (concat dropbox-notes-dir "notes.org"))

;;           (setq org-capture-templates
;;                 (quote (("n" "note" entry (file org-default-notes-file) "* %? :NOTE:\n"))))

;;           (setq org-agenda-files '("~/Dropbox/notes"))

;;           (defun org-weekly-agenda ()
;;             (interactive)
;;             (org-agenda nil "a"))

;;           (global-set-key (kbd "C-c t") 'org-weekly-agenda)

;;           (font-lock-add-keywords 'org-mode
;;                                   '(("^ +\\([-*]\\) "
;;                                      (0 (prog1 ()
;;                                           (compose-region (match-beginning 1) (match-end 1) "•"))))))
;;           (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;;           (global-set-key "\C-cl" 'org-store-link)
;;           (global-set-key (kbd "C-c c") 'org-capture)
;;           (global-set-key (kbd "C-c C-c") 'org-capture)
;;           (global-set-key "\C-ca" 'org-agenda)))

(setq shell-file-name "fish")
(setenv "SHELL" shell-file-name)

(use-package which-key
  :init (which-key-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))))

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

;;(set-frame-font "Lucida Grande Mono 17")
;;(set-frame-font "Menlo 15")
;;(set-frame-font "Source Code Pro 16")
;;(set-frame-font "mononoki 17")

;;(add-to-list 'default-frame-alist '(font . "Source Code Pro-16:weight=semi-bold"))
(add-to-list 'default-frame-alist '(font . "Menlo 17"))
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(server-start)
