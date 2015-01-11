(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(setq package-enable-at-startup nil)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(use-package
                       clojure-mode
                       company
                       key-chord
                       sane-term
                       emr
                       js2-mode
                       go-mode
                       go-eldoc
                       undo-tree
                       browse-kill-ring
                       golint
                       flycheck
                       projectile-rails
                       ag color-identifiers-mode
                       exec-path-from-shell expand-region
                       flx-ido find-file-in-project
                       ace-jump-mode helm-swoop
                       highlight-symbol ido-hacks
                       inf-ruby magit underwater-theme
                       mark-multiple multiple-cursors
                       projectile rainbow-delimiters
                       rbenv rhtml-mode
                       helm-projectile
                       rspec-mode ruby-mode
                       yaml-mode smartparens
                       smex yasnippet))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(set-terminal-coding-system nil)
(set-keyboard-coding-system nil)
(prefer-coding-system 'utf-8)
(setq fill-column 80)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'meta)
(setq-default mac-option-modifier 'super)
(setq-default mac-pass-command-to-system nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))



;; Don't combine TAGS lists
(setq tags-add-tables nil)


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
      delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"
      ispell-program-name "/usr/local/bin/aspell"
      enable-recursive-minibuffers t)

(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(global-auto-revert-mode 1)
(winner-mode 1)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|NOTE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)



;;(add-hook 'prog-mode-hook '(lambda () (flyspell-prog-mode)))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(autoload 'epa "epa-file-mode" t)
(epa-file-enable)

(setq paren-dont-touch-blink t)
(require 'mic-paren)
(paren-activate)
(setq paren-match-face 'highlight)
(setq paren-sexp-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(global-subword-mode 1)

;; undo setting
(setq undo-no-redo t
      undo-limit 600000
      undo-strong-limit 900000)

;; history
(setq history-length 500
      history-delete-duplicates t)

;; (global-linum-mode t)
;; (setq linum-format "%3d ")

(require 'use-package)

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (setenv "GOPATH" (concat (getenv "HOME") "/code/go:" (getenv "GOPATH")))
  (push "/opt/local/bin" exec-path)
  (push "~/.rbenv/shims" exec-path)
  (push "~/bin" exec-path))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; ;;;; multiple-cursors
(use-package multiple-cursors
  :init (progn (require 'inline-string-rectangle)
               (global-set-key (kbd "C-x r t") 'inline-string-rectangle)
               (global-set-key (kbd "C->") 'mc/mark-next-like-this)
               (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
               (global-set-key (kbd "C-*") 'mc/mark-all-like-this)))


(use-package ace-jump-mode
  :init
  (global-set-key (kbd "C-/") 'ace-jump-word-mode)
  (global-set-key (kbd "M-1") 'ace-jump-word-mode))

;;;; rainbow-delimeters
(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(use-package highlight-symbol
  :init (progn
          (add-hook 'prog-mode-hook 'highlight-symbol-mode)
          (setq highlight-symbol-idle-delay 0)))

;;;; IDO-MODE
;; Display ido results vertically, rather than horizontally
(ido-mode t)
(ido-everywhere t)
(setq ido-create-new-buffer 'always)
(set-default 'imenu-auto-rescan t)
(setq ido-flex-match t)
(setq ido-enable-flex-matching t)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-files "\\.keep")
(setq ido-file-extensions-order '(".rb" ".clj" ".el" ".scala" ".java" ".md" ".conf" ".org"))
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

(use-package flx-ido
  :init (progn
          (flx-ido-mode 1)
          (setq gc-cons-threshold 20000000)
          (setq ido-use-faces nil)))


(use-package saveplace
  :init (progn (setq-default save-place t)
               (setq save-place-file (expand-file-name ".places" user-emacs-directory))))

(use-package recentf
  :init (progn
          (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
          (recentf-mode t)
          (setq recentf-max-saved-items 1000)
          (setq recentf-max-menu-items 50)
          (add-to-list 'recentf-exclude "\\.revive\\'")
          (add-to-list 'recentf-exclude "elpa")))



;;;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers nil)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq nrepl-buffer-name-separator "-")
(setq cider-repl-display-in-current-window t)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(use-package fancy-narrow
  :init (fancy-narrow-mode))

(use-package smex
  :init
  (progn
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)))

(use-package smartscan
  :init (add-hook 'prog-mode-hook 'smartscan-mode))

(use-package expand-region)

(use-package smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)
;;(show-smartparens-global-mode +1)

(use-package easy-kill
  :init (global-set-key [remap kill-ring-save] 'easy-kill))


(use-package hungry-delete
  :init (global-hungry-delete-mode))

(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(add-hook 'compilation-filter-hook #'prelude-colorize-compilation-buffer)


(setq compilation-scroll-output 'first-error) ;; follows output


(use-package font-lock+)

;; (use-package auto-dim-other-buffers
;;   :init (auto-dim-other-buffers-mode t))

(use-package ag
  :init (setq ag-highlight-search t))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(unless (getenv "TMUX")
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))

(use-package wrap-region
  :init (progn
          ;; wrap-region
          (wrap-region-global-mode +1)
          ;; add wrappers
          (wrap-region-add-wrapper "`" "`")
          (wrap-region-add-wrapper "{" "}")))

(use-package smartscan
  :init (smartscan-mode 1))

(use-package helm-swoop)


(use-package ace-jump-mode
  :init (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))

(use-package ace-isearch
  :init (global-ace-isearch-mode +1))

(use-package expand-region
  :init (global-set-key (kbd "M-2") 'er/expand-region))

(use-package kpm-list
  :init (global-set-key (kbd "C-x C-b") 'kpm-list))

(use-package undo-tree
  :init (undo-tree-mode))

(use-package diminish
  :init (progn
          (eval-after-load "filladapt" '(diminish 'filladapt-mode))))


(use-package sane-term
  :init (progn
          (setq sane-term-shell-command "/bin/zsh")
          (global-set-key (kbd "C-c t") 'sane-term)
          (global-set-key (kbd "C-c T") 'sane-term-create)))

(use-package ibuffer-vc
  :init (progn
          (require 'ibuf-ext)
          (add-to-list 'ibuffer-never-show-predicates "^\\*")
          (add-to-list 'ibuffer-never-show-predicates "TAGS")
          (add-hook 'ibuffer-hook
                    (lambda ()
                      (ibuffer-vc-set-filter-groups-by-vc-root)
                      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic))))))

;; (use-package whitespace
;;   :init (progn
;;           (setq whitespace-style '(face empty lines-tail trailing))
;;           (setq whitespace-line-column 80)
;;           (setq whitespace-global-modes '(not git-commit-mode))
;;           (global-whitespace-mode)))

(use-package emr
  :init (progn
          (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
          (add-hook 'prog-mode-hook 'emr-initialize)))

(use-package re-builder
  :init (setq reb-re-syntax 'string))

(display-time-mode -1)
(provide 'basic-settings)
