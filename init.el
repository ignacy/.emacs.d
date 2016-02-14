(package-initialize)

(setq mac-command-modifier 'meta)
(setq inhibit-startup-message 't)
(setq tags-add-tables nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode -1)
(show-paren-mode 1)
(setq ring-bell-function 'ignore)
(delete-selection-mode t)
(load-library "url-handlers")
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(require 'use-package)
(use-package exec-path-from-shell
  :init (progn
          (setq exec-path-from-shell-arguments '("-l"))
          (when (memq window-system '(mac ns))
            (exec-path-from-shell-initialize))))

(use-package diminish)

(use-package company
  :init (progn
          (setq company-dabbrev-downcase nil)
          (setq company-dabbrev-ignore-case nil)
          (global-company-mode t)
          (diminish 'company-mode)))

(setq abbrev-file-name "~/.emacs.d/abbrevations")
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)
(setq compilation-scroll-output t)


(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(use-package elixir-mode)

(use-package alchemist)


(ido-mode 1)
(ido-everywhere)

(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(setq ido-create-new-buffer 'always)
(set-default 'imenu-auto-rescan t)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

(use-package flx-ido
  :init (progn
          (flx-ido-mode 1)
          ;; disable ido faces to see flx highlights.
          (setq ido-enable-flex-matching t)
          (setq ido-use-faces nil)))

(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)

(global-set-key (kbd "M-/") 'hippie-expand)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(use-package projectile-rails)
(use-package projectile
  :init (progn
          (defadvice find-tag-at-point (before auto-visti-tags)
            "Load default TAGS file from home directory if needed"
            (visit-tags-table (concat (projectile-project-root) "TAGS")))

          (ad-activate 'find-tag-at-point)
          (projectile-global-mode)
          (diminish 'projectile-mode)
          (add-hook 'projectile-mode-hook 'projectile-rails-on))
  :bind ("C-c C-p" . projectile-switch-project))

(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'projectile-switch-to-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c m") 'projectile-rails-find-current-spec)


(use-package highlight-symbol
  :init (progn
          (add-hook 'prog-mode-hook 'highlight-symbol-mode)
          (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
          (setq highlight-symbol-idle-delay 0)))

(use-package ruby-mode
  :init (progn
          (add-hook 'ruby-mode-hook
                    (lambda ()
                      (subword-mode 1)
                      ))))

(use-package inf-ruby)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)


(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
;;(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren '(?\[ ?\] t))
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

(use-package ruby-hash-syntax)

(use-package rubocop
  :config (progn
            (setq rubocop-check-command "/Users/ignacymoryc/.rbenv/shims/rubocop --format emacs")
            (setq rubocop-autocorrect-command "/Users/ignacymoryc/.rbenv/shims/rubocop -a --format emacs")
            ))


(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))

(use-package rspec-mode
  :ensure  rspec-mode
  :config (progn
            (setq rspec-use-rake-when-possible nil)
            (setq rspec-use-rvm nil)
            (setq rspec-use-bundler-when-possible nil)
            ;;(setq rspec-command-options "--format progress --order random")
            ))


(use-package recentf
  :init (progn
          (setq recentf-auto-cleanup 'never)
          (recentf-mode t)
          (setq recentf-max-saved-items 2000)
          (setq recentf-max-menu-items 25)

          (defun recentf-ido-find-file ()
            "Find a recent file using Ido."
            (interactive)
            (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
              (when file
                (find-file file))))))

(global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)

(use-package wrap-region
  :init (progn
          (wrap-region-global-mode +1)
          (wrap-region-add-wrapper "`" "`")
          (wrap-region-add-wrapper "{" "}")))

(use-package expand-region
  :defer t
  :bind ("M-2" . er/expand-region))

(use-package magit
  :config (setq magit-completing-read-function 'ido-completing-read)
  :init (global-set-key (kbd "C-x g") 'magit-status))


(use-package ag
  :init (global-set-key (kbd "M-r") 'ag-project))

(global-auto-revert-mode 1)

(global-set-key (kbd "C-<tab>") (lambda () (interactive) (switch-to-buffer (other-buffer (current-buffer) 1))))
(global-set-key (kbd "C-x i") 'indent-region-or-buffer)
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-region (point-min) (point-max))
        (message "Indented buffer.")))))


(use-package anzu
  :init (progn
          (global-anzu-mode +1)
          (global-set-key (kbd "M-c") 'anzu-query-replace-regexp)
          (diminish 'anzu-mode)))


(setq echo-keystrokes 0.1)

(defun join-lines (arg)
  (interactive "p")
  (end-of-line)
  (delete-char 1)
  (delete-horizontal-space)
  (insert " "))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(defun post-to-s3 ()
  (interactive)
  (compile (concat "s3cmd -P put " (buffer-file-name) " s3://imthings")))

(defun publish-file ()
  (interactive)
  (let ((content (replace-regexp-in-string
                  "\n$" ""
                  (shell-command-to-string (concat "~/bin/producer.rb " (buffer-file-name)))))
        (output-name (concat "http://imthings.s3.amazonaws.com/"
                             (file-name-base (buffer-file-name))
                             ".html")))
    (progn
      (compile (concat "s3cmd -P put " content " s3://imthings"))
      (kill-new output-name))))


(defun open-previous-line (arg)
  "Open a new line before the current one.
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(global-set-key (kbd "M-j") 'join-lines)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-S-o") 'move-line-up)
(global-set-key (kbd "C-o") 'open-previous-line)


(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a `before-save-hook`, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(add-hook 'before-save-hook 'cleanup-buffer-safe)

(use-package idomenu
  :bind ("C-'" . idomenu))
;;
;; (use-package fill-column-indicator
;;   :config (setq fci-rule-column 120)
;;   :init (add-hook 'prog-mode-hook 'fci-mode))

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

(use-package js2-mode
  :init (progn
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


(when (window-system)
  (set-default-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\)\\|[!=]\\)")
               (35 . ".\\(?:[(?[_{]\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*\\)\\|[*/]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|\\+\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (58 . ".\\(?:[:=]\\)")
               (59 . ".\\(?:;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:[:=?]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:[=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(set-frame-font "Fira Code 14")
;;(set-frame-font "Source Code Pro 13")

(use-package smartparens
  :config (progn
            (require 'smartparens-config)
            (smartparens-global-mode t))
  (defun handle-curlys (id action context)
    (when (eq action 'insert)
      (newline)
      (newline)
      (indent-according-to-mode)
      (previous-line)
      (indent-according-to-mode)))

  (sp-local-pair 'go-mode "{" nil :post-handlers '(:add handle-curlys))
  (sp-local-pair 'js2-mode "{" nil :post-handlers '(:add handle-curlys))
  (defun my-elixir-do-end-close-action (id action context)
    (when (eq action 'insert)
      (newline-and-indent)
      (previous-line)
      (indent-according-to-mode)))

  (sp-with-modes '(elixir-mode)
    (sp-local-pair "do" "end"
                   :when '(("SPC" "RET"))
                   :post-handlers '(:add my-elixir-do-end-close-action)
                   :actions '(insert))))

;; (use-package rainbow-identifiers
;;   :init (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))
(require 'sane-term)
(global-set-key (kbd "C-x t") 'sane-term)
(global-set-key (kbd "C-x T") 'sane-term-create)
(global-set-key (kbd "M-z") 'undo)

(load-theme 'base16-harmonic16-dark t)

(setq column-number-mode t)


(use-package org
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
          (global-set-key "\C-cl" 'org-store-link)
          (global-set-key "\C-ca" 'org-agenda)))

(defun add-statistics ()
  (interactive)
  (shell-command-to-string
   (concat "echo \"" (format-time-string "%s") "," (buffer-file-name) "\" >> ~/Dropbox/notes/actionstats.csv")))

(add-hook 'after-save-hook 'add-statistics)
