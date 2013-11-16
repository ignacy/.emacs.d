(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(markdown-mode yaml-mode haml-mode
                      textmate undo-tree colorsarenice-theme diminish
                      exec-path-from-shell ido-hacks rspec-mode ag
                      scala-mode2 smex flx-ido fiplr rubocop ruby-end
                      git-gutter rainbow-mode flycheck
                      coffee-mode expand-region helm sbt-mode
                      clojure-mode multiple-cursors magit
                      mark-multiple git-messenger flatland-theme
                      projectile org ruby-mode inf-ruby
                      smartparens gist yasnippet
                      rainbow-delimiters idle-highlight-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(setq visible-bell t
      show-paren-style 'mixed
      scroll-margin 1
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      croll-conservatively 10000
      scroll-preserve-screen-position 1
      auto-save-default nil
      initial-scratch-message nil
      make-backup-files nil
      kill-buffer-query-functions (remq 'process-kill-buffer-query-function kill-buffer-query-functions)
      inhibit-startup-screen t
      bookmark-default-file "~/.bookmarks_emacs"
      bookmark-save-flag 1
      x-select-enable-clipboard t
      confirm-nonexistent-file-or-buffer nil
      slime-net-coding-system 'utf-8-unix
      delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"
      ispell-program-name "/usr/local/bin/aspell"
      enable-recursive-minibuffers t)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(fringe-mode '(0 . 0))


(setq-default indent-tabs-mode nil)
(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(autoload 'epa "epa-file-mode" t)
(epa-file-enable)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(display-time-mode -1)
(global-subword-mode 1)

;;(global-hl-line-mode 1)
;;(set-face-attribute hl-line-face nil :underline nil)
;;(set-face-background 'hl-line "#222")
;;(set-face-background 'hl-line "#ddd")

(mouse-wheel-mode t)
;;(menu-bar-mode t)
(setq-default mac-option-modifier 'super)
(setq-default mac-pass-command-to-system nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(require 'helm-config)
(helm-mode 1)

(require 'git-messenger)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)
(setq git-messenger:show-detail 't)

;;(set-frame-font "OpenDyslexicMono 14")
(set-frame-font "Monaco 15")
;;(set-frame-font "Hermit 15")
;;(set-frame-font "Source Code Pro 15")

(setq show-trailing-whitespace t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(global-auto-revert-mode 1)
(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

;;;; path
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "~/bin" exec-path))

(exec-path-from-shell-initialize)

;;;; multiple-cursors
(require 'multiple-cursors)
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-<return>") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-S-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-M-=") 'mc/insert-numbers)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;;;; rainbow-delimeters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable)

;;;; faces
(make-face 'font-lock-number-face)
(set-face-attribute 'font-lock-number-face nil :inherit font-lock-constant-face)
(setq font-lock-number-face 'font-lock-number-face)
(defvar font-lock-number "[0-9-.]+\\([eE][+-]?[0-9]*\\)?")
(defvar font-lock-hexnumber "0[xX][0-9a-fA-F]+")
(defun add-font-lock-numbers (mode)
  (font-lock-add-keywords
   mode
   `((,(concat "\\<\\(" font-lock-number "\\)\\>" ) 0 font-lock-number-face)
     (,(concat "\\<\\(" font-lock-hexnumber "\\)\\>" ) 0 font-lock-number-face)
     )))

;;;; git-gutter
(require 'git-gutter)
(global-git-gutter-mode t)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)
;;;; idle-highlight
(require 'idle-highlight-mode)
(setq idle-highlight-idle-time 2)
(defun idle-coding-hook ()
  (idle-highlight-mode t))
(add-hook 'prog-mode-hook 'idle-coding-hook)

(set-default 'imenu-auto-rescan t)

;;;; IDO-MODE
;; Display ido results vertically, rather than horizontally
(ido-mode t)
(ido-everywhere t)
(setq ido-create-new-buffer 'always)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-file-extensions-order '(".rb" ".clj" ".el" ".scala" ".java" ".md" ".conf" ".org"))
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)
(require 'flx-ido)
(setq ido-use-faces nil)
(flx-ido-mode 1)

;; ;;;; ORG mode
(setq org-return-follows-link t)
(setq org-directory "~/Dropbox/notes")
(setq org-mobile-inbox-for-pull "~/Dropbox/notes/notes.org")
(setq org-mobile-directory "~/Dropbox/Aplikacje/MobileOrg")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-bug-journal-file (concat org-directory "/bugs.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %i\n ")
        ("b" "Bug Journal" entry (file+datetree org-default-bug-journal-file)
         "* %?\nEntered on %U\n  %i\n  ")
        ("n" "Note" entry (file+datetree org-default-notes-file)
         "* %?\nEntered on %U\n  %i\n  ")))

(setq make-backup-files nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (clojure . t)
   (scala . t)
   (ruby . t)))

(require 'markdown-mode)
(setq markdown-imenu-generic-expression
      '(("title"  "^\\(.*\\)[\n]=+$" 1)
        ("h2-"    "^\\(.*\\)[\n]-+$" 1)
        ("h1"   "^# \\(.*\\)$" 1)
        ("h2"   "^## \\(.*\\)$" 1)
        ("h3"   "^### \\(.*\\)$" 1)
        ("h4"   "^#### \\(.*\\)$" 1)
        ("h5"   "^##### \\(.*\\)$" 1)
        ("h6"   "^###### \\(.*\\)$" 1)
        ("fn"   "^\\[\\^\\(.*\\)\\]" 1)
        ))
(setq imenu-generic-expression markdown-imenu-generic-expression)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode t)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 30)
(add-to-list 'recentf-exclude "\\.revive\\'")
(add-to-list 'recentf-exclude "elpa")
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'smartparens)
(require 'smartparens-config)
;; highlights matching pairs
(smartparens-global-mode t)
(show-smartparens-global-mode +1)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;;;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq nrepl-buffer-name-separator "-")
(setq cider-repl-display-in-current-window t)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)



(provide 'basic-settings)
