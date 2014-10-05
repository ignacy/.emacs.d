(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(setq package-enable-at-startup nil)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(use-package cider
                       clojure-mode company
                       projectile-rails
                       smyx-theme
                       ag color-identifiers-mode
                       exec-path-from-shell expand-region
                       flx-ido find-file-in-project
                       idle-highlight-mode ido-hacks
                       inf-ruby magit underwater-theme
                       mark-multiple multiple-cursors
                       projectile rainbow-delimiters
                       rbenv rhtml-mode
                       rspec-mode ruby-mode
                       yaml-mode smartparens
                       smex yasnippet))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(set-terminal-coding-system nil)
(set-keyboard-coding-system nil)
(prefer-coding-system 'utf-8)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq-default mac-option-modifier 'super)
(setq-default mac-pass-command-to-system nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq tags-add-tables nil)
(fringe-mode '(0 . 0))

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

(global-auto-revert-mode 1)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
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
(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(autoload 'epa "epa-file-mode" t)
(epa-file-enable)

(show-paren-mode t)
(setq show-paren-style 'paranthesis)
(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(global-subword-mode 1)
(blink-cursor-mode 1)

;; (global-linum-mode t)
;; (setq linum-format "%3d ")

(require 'use-package)

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
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
  (global-set-key (kbd "§") 'ace-jump-word-mode))

;;;; rainbow-delimeters
(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;;;; idle-highlight
(use-package idle-highlight-mode
  :init (idle-highlight-mode t))

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

(use-package expand-region
  :init (global-set-key (kbd "§") 'er/expand-region))


(use-package smartparens)
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode +1)

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



(use-package wrap-region)
(use-package smartscan
  :init (smartscan-mode 1))

(display-time-mode -1)
(provide 'basic-settings)
