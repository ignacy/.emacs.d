(package-initialize)
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(setq package-enable-at-startup nil)


;;; Commentary: init -- my emacs configuration

(require 'cl)
(setq debug-on-error nil)
(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))

(load custom-file)

(set-fringe-mode '(0 . 0))
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'meta)
(setq-default mac-option-modifier 'super)
(setq-default mac-pass-command-to-system nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(setq split-height-threshold nil)
(setq split-width-threshold 160)

;; Don't combine TAGS lists
(setq tags-add-tables nil)

(show-paren-mode)


(setq visible-bell t
      x-select-enable-clipboard t
      x-select-enable-primary t
      mouse-yank-at-point t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      auto-save-default nil
      initial-scratch-message nil
      make-backup-files nil
      kill-buffer-query-functions (remq 'process-kill-buffer-query-function kill-buffer-query-functions)
      inhibit-startup-screen t
      bookmark-default-file "~/.bookmarks_emacs"
      bookmark-save-flag 1
      confirm-nonexistent-file-or-buffer nil
      slime-net-coding-system 'utf-8-unix
      confirm-kill-emacs (quote yes-or-no-p)
      ispell-program-name "/usr/local/bin/aspell"
      enable-recursive-minibuffers t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-auto-revert-mode 1)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|NOTE\\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)

(autoload 'epa "epa-file-mode" t)
(epa-file-enable)
;;(setq paren-dont-touch-blink t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(setq tramp-default-method "ssh")

;; undo setting
(setq undo-no-redo t
      undo-limit 600000
      undo-strong-limit 900000)

;; history
(setq history-length 500
      history-delete-duplicates t)

(require 'use-package)

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (setenv "GOPATH" (concat (getenv "HOME") "/code/go:" (getenv "GOPATH")))
  (push "/opt/local/bin" exec-path)
  (push "~/.rbenv/shims" exec-path)
  (push "~/bin" exec-path))


(use-package exec-path-from-shell
  :ensure exec-path-from-shell
  :init (progn
          (when (memq window-system '(mac ns))
            (exec-path-from-shell-initialize))))

(global-subword-mode 1)
(use-package syntax-subword
  :ensure syntax-subword
  :init (global-syntax-subword-mode 1))

(use-package go-mode
  :ensure go-mode
  :defer t
  :config
  (progn
    (defun my-go-mode-hook ()
      (setq gofmt-command "goimports")
      (add-hook 'before-save-hook 'gofmt-before-save)
      (set (make-local-variable 'company-backends) '(company-go))
      ;;(if (not (string-match "go" compile-command))
      (subword-mode 1)
      (set (make-local-variable 'compile-command)
           "go vet && go test -cover -v && go build -v")
      ;;                )

      (setq tab-width 2)
      (flycheck-mode)
      (setq standard-indent 2)
      (setq indent-tabs-mode nil)
      (local-set-key (kbd "M-.") 'godef-jump))
    ;;(add-hook 'go-mode-hook 'go-oracle-mode)
    (add-hook 'go-mode-hook 'my-go-mode-hook)
    (add-hook 'go-mode-hook 'go-eldoc-setup)))

(use-package go-eldoc
  :ensure go-eldoc)

(use-package golint
  :ensure golint)

(use-package company-go
  :ensure company-go)


;; ;; ;;;; multiple-cursors
;; (use-package multiple-cursors
;;   :ensure multiple-cursors
;;   :defer t
;;   :bind (("C-x r t" . 'mc/edit-lines)
;;          ("C->" . 'mc/mark-next-like-this)
;;          ("C-<" . 'mc/mark-previous-like-this)
;;          ("C-*" . 'mc/mark-all-like-this)))

;;;; rainbow-delimeters
(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(use-package flycheck
  :ensure flycheck
  :init (progn
          (setq flycheck-ruby-rubocop-executable "~/.rbenv/versions/2.2.1/bin/rubocop") ))

;; (use-package color-identifiers-mode
;;   :ensure color-identifiers-mode
;;   :init (global-color-identifiers-mode))

(use-package highlight-symbol
  :ensure highlight-symbol
  :init (progn
          (add-hook 'prog-mode-hook 'highlight-symbol-mode)
          (setq highlight-symbol-idle-delay 0)))

;;;; IDO-MODE
;; Display ido results vertically, rather than horizontally
(ido-mode t)
(ido-everywhere t)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-files "\\.keep")
(setq ido-file-extensions-order '(".rb" ".clj" ".el" ".scala" ".java" ".md" ".conf" ".org"))
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
  :ensure flx-ido
  :init (progn
          (flx-ido-mode 1)
          (setq gc-cons-threshold 20000000)
          (setq ido-enable-flex-matching t)
          (setq ido-use-faces nil)))

(use-package recentf
  :ensure recentf
  :init (progn
          (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
          (recentf-mode t)
          (setq recentf-max-saved-items 1000)
          (setq recentf-max-menu-items 50)
          (add-to-list 'recentf-exclude "\\.revive\\'")
          (add-to-list 'recentf-exclude "elpa")))


(use-package smex
  :ensure smex
  :init (smex-initialize)
  :bind ("M-x" . smex))

(use-package smartparens
  :ensure smartparens
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
  (sp-local-pair 'js2-mode "{" nil :post-handlers '(:add handle-curlys)))

(use-package wrap-region
  :ensure  wrap-region
  :init (progn
          ;; wrap-region
          (wrap-region-global-mode +1)
          ;; add wrappers
          (wrap-region-add-wrapper "`" "`")
          (wrap-region-add-wrapper "{" "}")))

(use-package ag
  :ensure ag
  :init (setq ag-highlight-search t))

(use-package expand-region
  :ensure  expand-region
  :defer t
  :bind ("M-2" . er/expand-region))

(use-package wakatime-mode
  :ensure wakatime-mode
  :init (progn
          (setq wakatime-api-key "378d5540-75fa-415f-8a20-51aac381b1ac")
          (setq wakatime-cli-path "/usr/local/bin/wakatime")
          (setq wakatime-python-bin "/usr/local/bin/python")
          (global-wakatime-mode)))

(use-package find-file-in-project
  :ensure find-file-in-project
  :bind ("C-x f" . find-file-in-project))

(load-theme 'base16-isotope-dark t)

;; red line after 80 characters
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;; (setq fci-rule-column 80)
;; (setq fci-rule-color "red")

(use-package helpers)

(use-package bind-key
  :ensure bind-key)

;;;; Customize some packages
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

(use-package js2-mode
  :ensure js2-mode
  :init (progn
          ;; Javascript
          (setq-default js2-basic-offset 4)
          ;; JSON
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
(use-package projectile
  :ensure projectile
  :init (progn
          (setq projectile-completion-system 'ido)
          (projectile-global-mode)
          (setq projectile-enable-caching t)
          (setq projectile-switch-project-action 'projectile-find-file)

          (defadvice find-tag-at-point (before auto-visti-tags)
            "Load default TAGS file from home directory if needed"
            (visit-tags-table (concat (projectile-project-root) "TAGS")))
          (ad-activate 'find-tag-at-point))

  )

(use-package perspective
  :init (persp-mode)
  :ensure perspective)

(use-package persp-projectile
  :ensure persp-projectile
  :defer t
  :init (global-set-key (kbd "C-c C-p") 'projectile-persp-switch-project))

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-files "TAGS*")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "log")))

(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)
(require 'init-flycheck)

(load-library "compile")

(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(add-hook 'compilation-filter-hook #'prelude-colorize-compilation-buffer)
(setq compilation-scroll-output 'first-error) ;; follows output



(use-package company
  :ensure  company
  :defer t
  :init (progn
          (company-quickhelp-mode 1)
          (push 'company-readline company-backends)
          (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))
          (define-key company-active-map "\t" 'company-yasnippet-or-completion)
          (global-company-mode)
          ))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)

(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))


(use-package smart-modeline)

(use-package rbenv
  :ensure rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))

;;(set-frame-font "Office Code Pro 15")
(set-frame-font "Source Code Pro 15")
;;(set-frame-font "Inconsolata-g 15")
;;(set-frame-font "Lucida Grande Mono 14")

(mapc (lambda (face) (set-face-attribute face nil :weight 'normal :underline nil)) (face-list))

(bind-key "M-r" 'projectile-ag)
(bind-key "M-c" 'query-replace)
(bind-key "C-c TAB" 'align-regexp)
(bind-key "C-x C-r" 'ido-recentf-open)
(bind-key "C-x i" 'indent-region-or-buffer)
(bind-key "M-h" 'backward-kill-word)
(bind-key "C-x C-o" 'other-window)
(bind-key "C-," 'find-tag-at-point)
(bind-key "C-x C-f" 'ido-find-file)
(bind-key "C-x f" 'projectile-find-file)
(bind-key "C-x k" 'im/kill-current-buffer)
(bind-key "C-<tab>" 'switch-to-previous-buffer)
(bind-key "M-g" 'goto-line-with-feedback)
(bind-key "M-u" 'toggle-letter-case)
(bind-key "C-j" 'newline-and-indent)
(bind-key "M-\." 'find-tag-at-point)
(bind-key "M-j" 'join-lines)
(bind-key "C-S-o" 'move-line-up)
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))
(global-set-key (kbd "\C-w") (make-backward-kill-word-fn backward-kill-word (1)))
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [mode-line mouse-2] 'ignore)
(global-set-key [(meta delete)] 'backward-kill-word)
