(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(setq package-enable-at-startup nil)
(when (not package-archive-contents)
  (package-refresh-contents))

;;(eval-buffer)

(defvar my-packages '(
                      use-package
                      markdown-mode
                      cider
                      clojure-mode
                      colorsarenice-theme
                      company
                      evil
                      evil-leader
                      exec-path-from-shell
                      fancy-narrow
                      fiplr
                      flatland-theme
                      flx-ido
                      gist
                      git-gutter
                      git-messenger
                      helm
                      helm-git-grep
                      helm-swoop
                      idle-highlight-mode
                      ido-hacks
                      inf-ruby
                      magit
                      mark-multiple
                      multiple-cursors
                      org
                      projectile
                      perspective
                      persp-projectile
                      rainbow-delimiters
                      rbenv
                      rhtml-mode
                      rspec-mode
                      ruby-end
                      ruby-mode
                      smartparens
                      smex
                      yasnippet))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

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

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(global-auto-revert-mode 1)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|NOTE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)


(setq-default indent-tabs-mode nil)
(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(autoload 'epa "epa-file-mode" t)
(epa-file-enable)

(show-paren-mode t)
(setq show-paren-style 'paranthesis)
(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(display-time-mode -1)
;;(global-subword-mode 1)
(global-superword-mode 1)
(blink-cursor-mode 1)

(mouse-wheel-mode t)
;;(menu-bar-mode t)
(setq-default mac-option-modifier 'super)
(setq-default mac-pass-command-to-system nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(require 'use-package)

;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))

(eval-after-load 'helm
  '(define-key helm-map (kbd "C-e") 'helm-etags-select))

(require 'git-messenger)
(setq git-messenger:show-detail 't)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)


(setq show-trailing-whitespace t)

;; make characters after column 80 purple
;; (setq whitespace-style (quote (face trailing tab-mark lines-tail)))
;; (add-hook 'find-file-hook 'whitespace-mode)

                                        ; transform literal tabs into a right-pointing triangle
(setq whitespace-display-mappings ;http://ergoemacs.org/emacs/whitespace-mode.html
      '(
        (tab-mark 9 [9654 9] [92 9])
                                        ;others substitutions...
        ))


(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "~/.rbenv/shims" exec-path)
  (push "~/bin" exec-path))

(exec-path-from-shell-initialize)


(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))

;;;; multiple-cursors
(use-package multiple-cursors
  :init (progn (require 'inline-string-rectangle)
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
               (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)))

(use-package ace-jump-mode
  :init (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))

;;;; rainbow-delimeters
(use-package rainbow-delimiters
  :init
  (progn
    (require 'cl-lib)
    (require 'color)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-name (face-foreground face) 30)))

    (require 'paren) ; show-paren-mismatch is defined in paren.el
    (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                        :foreground 'unspecified
                        :strike-through t
                        :inherit 'show-paren-mismatch)

    (global-rainbow-delimiters-mode)))

;;;; Git-Gutter
(use-package git-gutter
  :init (global-git-gutter-mode t))

;;;; idle-highlight
(use-package idle-highlight-mode
  :init (progn (setq idle-highlight-idle-time 1.5)
               (defun idle-coding-hook ()
                 (idle-highlight-mode t))
               (add-hook 'prog-mode-hook 'idle-coding-hook)))

(set-default 'imenu-auto-rescan t)


;; (use-package zop-to-char
;;   :init (progn
;;           (global-set-key (kbd "M-c") 'zop-to-char)))


(use-package iregister
  :init (progn
          (global-set-key (kbd "C-\\") 'iregister-jump-to-next-marker)
          (global-set-key (kbd "M-|") 'iregister-jump-to-previous-marker)
          (global-set-key (kbd "M-\\") 'iregister-point-or-text-to-register)))

;;;; IDO-MODE
;; Display ido results vertically, rather than horizontally
(ido-mode t)
(ido-everywhere t)
(setq ido-create-new-buffer 'always)
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
          (setq recentf-max-saved-items 700)
          (setq recentf-max-menu-items 50)
          (add-to-list 'recentf-exclude "\\.revive\\'")
          (add-to-list 'recentf-exclude "elpa")))


(use-package smartparens)
(use-package smartparens-config
  :init (progn
          (smartparens-global-mode t)
          (show-smartparens-global-mode +1)

          (global-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
          (global-set-key (kbd "C-M-e") 'sp-end-of-sexp)

          (define-key sp-keymap (kbd "C-M-a") 'sp-beginning-of-sexp)
          (define-key sp-keymap (kbd "C-M-e") 'sp-end-of-sexp)
          ;; To free C-M-d in OS X, see
          ;; http://superuser.com/questions/326223/how-do-i-disable-the-command-control-d-word-definition-keyboard-shortcut-in-os-x
          (define-key sp-keymap (kbd "C-M-d") 'sp-kill-sexp)
          ;; Emulate paredit in smartparens-mode
          (define-key sp-keymap (kbd "M-J") 'sp-join-sexp)
          (define-key sp-keymap (kbd "<M-up>") 'sp-splice-sexp-killing-backward)
          (sp-with-modes sp--lisp-modes
            (sp-local-pair "(" nil :bind "C-("))
          (sp-with-modes '(rhtml-mode)
            (sp-local-pair "<" ">")
            (sp-local-pair "<%" "%>"))))

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


(use-package easy-kill
  :init (progn
          (global-set-key [remap mark-sexp] 'easy-mark)
          (global-set-key [remap kill-ring-save] 'easy-kill)))

;; (use-package helm :init
;;   (progn
;;     (require 'helm-config)
;;     (helm-mode 1)))

(use-package smex
  :init
  (progn
    (smex-initialize)
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

(use-package smartscan
  :init (add-hook 'prog-mode-hook 'smartscan-mode))


(use-package bookmark+)

(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

(fringe-mode '(0 . 0))


(provide 'basic-settings)
