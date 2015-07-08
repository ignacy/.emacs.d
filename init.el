(package-initialize)
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Commentary: init -- my emacs configuration

(require 'cl)
(setq debug-on-error nil)
(setq dotfiles-dir "~/.emacs.d")
(setq explicit-shell-file-name "/bin/zsh")

(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(load custom-file)

(setq fill-column 80)
(whitespace-mode)

(set-fringe-mode '(0 . 0))
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'meta)
(setq-default mac-option-modifier 'super)
(setq-default mac-pass-command-to-system nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq scroll-preserve-screen-position 'always)
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

;; (setq-default indent-tabs-mode nil)
;; (setq default-tab-width 2)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width        4)
(setq         tab-stop-list    (number-sequence 4 120 4))

;; setup junk whitespace types for when whitespace mode is active
(setq whitespace-style '(face tabs trailing empty))

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


(use-package emamux
  :ensure emamux
  :bind ("C-c s" . emamux:send-command))

(use-package yasnippet
  :ensure yasnippet
  :init (progn
          (setq yas-snippet-dirs
                (list (expand-file-name "snippets" dotfiles-dir)
                      ))
          (yas-global-mode)
          (setq yas-prompt-functions '(yas/ido-prompt))))

(use-package company
  :ensure  company
  :init (progn
          ;;(add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))
          ;;(define-key company-active-map "\t" 'company-yasnippet-or-completion)
          (setq company-dabbrev-downcase nil)
          (setq company-dabbrev-ignore-case nil)
          (global-company-mode t)))

(use-package alchemist
  :ensure alchemist
  :init (progn (setq alchemist-buffer-status-modeline nil)))

(use-package elixir-mode
  :ensure elixir-mode)

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

(use-package base16-theme
  :ensure base16-theme)


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

;; (use-package recentf
;;   :ensure recentf
;;   :init (progn
;;           (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
;;           (recentf-mode t)
;;           (setq recentf-max-saved-items 1000)
;;           (setq recentf-max-menu-items 50)
;;           (add-to-list 'recentf-exclude "\\.revive\\'")
;;           (add-to-list 'recentf-exclude "elpa")))


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

(use-package wgrep-ag
  :ensure wgrep-ag)

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


(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(load-theme 'planet t)
;;(load-theme 'sanityinc-tomorrow-night t)

;; red line after 80 characters
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;; (setq fci-rule-column 80)
;; (setq fci-rule-color "red")

(use-package helpers)

(use-package bind-key
  :ensure bind-key)

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
          (setq projectile-switch-project-action 'projectile-dired)

          (defadvice find-tag-at-point (before auto-visti-tags)
            "Load default TAGS file from home directory if needed"
            (visit-tags-table (concat (projectile-project-root) "TAGS")))

          (ad-activate 'find-tag-at-point))

  :bind ("C-x b" . projectile-switch-to-buffer))


(use-package perspective
  :init (persp-mode)
  :ensure perspective)

(use-package persp-projectile
  :ensure persp-projectile
  :defer t
  :bind ("C-c C-p" . projectile-persp-switch-project))

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-files "TAGS*")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "coverage")
     (add-to-list 'grep-find-ignored-directories "log")))

(use-package inf-ruby
  :ensure inf-ruby
  :config (progn
            (make-local-variable 'comint-prompt-read-only)
            (setq                 comint-prompt-read-only t))
  :init (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(use-package rspec-mode
  :ensure  rspec-mode
  :config (progn
            (setq rspec-use-rake-when-possible nil)
            (setq rspec-use-rvm nil)
            (setq rspec-use-bundler-when-possible nil)
            (setq rspec-command-options "--format progress --order random")
            ))

(use-package web-mode
  :ensure t
  :init (progn (setq web-mode-markup-indent-offset 2)
               (setq web-mode-css-indent-offset 2)
               (setq web-mode-code-indent-offset 2)
               (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))))

;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq ruby-use-encoding-map nil)


(use-package ruby-mode
  :ensure  ruby-mode
  :init (progn
          (add-hook 'ruby-mode-hook
                    (lambda ()
                      (subword-mode 1)
                      (flycheck-mode)

                      (when (and buffer-file-name
                                 (file-writable-p
                                  (file-name-directory buffer-file-name))
                                 (file-writable-p buffer-file-name)
                                 (if (fboundp 'tramp-list-remote-buffers)
                                     (not (subsetp
                                           (list (current-buffer))
                                           (tramp-list-remote-buffers)))
                                   t))
                        )))))

(define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)


(use-package rubocop
  :ensure rubocop
  :config (progn

            (setq rubocop-check-command "~/.rbenv/versions/2.2.1/bin/rubocop --format emacs")
            (setq rubocop-autocorrect-command "~/.rbenv/versions/2.2.1/bin/rubocop -a --format emacs")

            ))

(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)


(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)


(add-hook 'shell-mode-hook
          '(lambda ()
             (setq show-trailing-whitespace nil)
             (make-local-variable 'global-hl-line-mode)
             (setq global-hl-line-mode nil)
             (ansi-color-for-comint-mode-on)
             (toggle-truncate-lines 1)
             (set-face-foreground 'highlight nil)
             (font-lock-mode t)
             ;;(buffer-face-mode t) ; only in emacs 23
             ;;(buffer-face-set 'font-lock-small-face)
             (hl-line-mode nil)))

;;(setq comint-prompt-read-only nil)
(setq comint-process-echoes t)
;; term



(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)
            (ansi-color-for-comint-mode-on)
            (setq show-trailing-whitespace nil)
            (yas-minor-mode -1)
            (set (make-local-variable 'company-mode) nil)
            (set (make-local-variable 'transient-mark-mode) nil)
            (set (make-local-variable 'smartparens-mode) nil)
            (set (make-local-variable 'global-hl-line-mode) nil)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(use-package multi-term
  :ensure multi-term
  :init (setq multi-term-program "/bin/zsh"))

;; term
(defface term-color-black
  '((t (:foreground "#3f3f3f" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-red
  '((t (:foreground "#cc9393" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-green
  '((t (:foreground "#7f9f7f" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-yellow
  '((t (:foreground "#f0dfaf" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-blue
  '((t (:foreground "#6d85ba" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-magenta
  '((t (:foreground "#dc8cc3" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-cyan
  '((t (:foreground "#93e0e3" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-white
  '((t (:foreground "#dcdccc" :background "#272822")))
  "Unhelpful docstring.")
'(term-default-fg-color ((t (:inherit term-color-white))))
'(term-default-bg-color ((t (:inherit term-color-black))))

;; ansi-term colors
(setq ansi-term-color-vector
      [term term-color-black term-color-red term-color-green term-color-yellow
            term-color-blue term-color-magenta term-color-cyan term-color-white])

;; shell-mode
(defun sh (&optional name)
  (shell (concat "*" name "*")))

(defun zsh ()
  (interactive)
  (shell "zsh"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))


(use-package magit
  :ensure magit
  :bind ("C-x g" . magit-status)
  :init (progn
          (setq magit-completing-read-function 'magit-ido-completing-read)
          (add-hook 'git-commit-mode-hook 'magit-commit-mode-init)
          ;; close popup when commiting
          (defun magit-commit-mode-init () (when (looking-at "\n")
                                             (open-line 1)))
          ))

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

(use-package iedit
  :init (progn
          (defun iedit-dwim (arg)
            "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
            (interactive "P")
            (if arg
                (iedit-mode)
              (save-excursion
                (save-restriction
                  (widen)
                  ;; this function determines the scope of `iedit-start'.
                  (if iedit-mode
                      (iedit-done)
                    ;; `current-word' can of course be replaced by other
                    ;; functions.
                    (narrow-to-defun)
                    (iedit-start (current-word) (point-min) (point-max)))))))



          (global-set-key (kbd "C-;") 'iedit-dwim)
          ))


(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)

(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(use-package markdown-mode
  :ensure markdown-mode
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
          (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
          (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))))

(use-package rbenv
  :ensure rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))


;; (defun ido-recentf-open ()
;;   "Use `ido-completing-read' to \\[find-file] a recent file"
;;   (interactive)
;;   (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;       (message "Opening file...")
;;     (message "Aborting")))


(defun im/kill-current-buffer()
  "Most of the times you just want to kill currently opened buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)

(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a `before-save-hook`, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(add-hook 'before-save-hook 'cleanup-buffer-safe)

(defun find-tag-at-point ()
  (interactive)
  (find-tag (thing-at-point 'symbol)))

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

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
                   name (file-name-nondirectory new-name)))))))




(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)


(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(defadvice other-window (after other-window-now activate)
  (when (< (window-width) 80)
    (enlarge-window (- 80 (window-width)) t)))

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))
(add-hook 'after-save-hook 'byte-compile-current-buffer)

(defun join-lines (arg)
  (interactive "p")
  (end-of-line)
  (delete-char 1)
  (delete-horizontal-space)
  (insert " "))

(ignore-errors (load-file "~/.local.el"))

(defun ora-test-emacs ()
  (interactive)
  (require 'async)
  (async-start
   (lambda () (shell-command-to-string
               "emacs --batch --eval \"
(condition-case e
    (progn
      (load \\\"~/.emacs.d/init.el\\\")
      (message \\\"-OK-\\\"))
  (error
   (message \\\"ERROR!\\\")
   (signal (car e) (cdr e))))\""))
   `(lambda (output)
      (if (string-match "-OK-" output)
          (when ,(called-interactively-p 'any)
            (message "All is well"))
        (switch-to-buffer-other-window "*startup error*")
        (delete-region (point-min) (point-max))
        (insert output)
        (search-backward "ERROR!")))))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one.
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))


(defface sm-default-face
  '((t :inherit default :foreground "#FF1F68"))
  "Smart modeline " :group 'smart-modeline-faces)

(defface sm-project-face
  '((t :inherit default :foreground "lightblue"))
  "Smart modeline " :group 'smart-modeline-faces)
                                        ;
(defface sm-file-face
  '((t :inherit default :foreground "#FF1F69"))
  "Smart modeline " :group 'smart-modeline-faces)

(setq-default mode-line-format
              (list
               " "
               '(:eval (if (buffer-modified-p)
                           (propertize "*" 'face 'sm-default-face
                                       'help-echo "Buffer has been modified")
                         " "))

               '(:eval (propertize "%b " 'face 'sm-file-face
                                   'help-echo (buffer-file-name)))

               " "
               '(:eval (propertize (projectile-project-name)
                                   'face 'sm-project-face))

               ))


(mapc (lambda (face) (set-face-attribute face nil :weight 'normal :underline nil)) (face-list))

(use-package idomenu
  :ensure idomenu
  :bind ("C-'" . idomenu))


(bind-key "C-o" 'open-previous-line)
(bind-key "C-c t" 'multi-term)
(bind-key "M-r" 'projectile-ag)
(bind-key "M-c" 'query-replace)
(bind-key "C-c TAB" 'align-regexp)
;;(bind-key "C-x C-r" 'ido-recentf-open)
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
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [mode-line mouse-2] 'ignore)
(global-set-key [(meta delete)] 'backward-kill-word)
(global-set-key [delete] 'delete-char)
(global-set-key [M-delete] 'kill-word)
(define-key key-translation-map [?\C-h] [?\C-?])
(put 'narrow-to-region 'disabled nil)

;;(set-frame-font "Source Code Pro 14")
;;(set-frame-font "Inconsolata-g 14")
(set-frame-font "Lucida Grande Mono 15")
;;(set-frame-font "Monoid 13")
