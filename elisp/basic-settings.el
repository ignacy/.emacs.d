(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)


(setq compilation-ask-about-save nil)
(set-terminal-coding-system nil)
(set-keyboard-coding-system nil)
(prefer-coding-system 'utf-8)
(setq fill-column 80)

(setq kill-do-not-save-duplicates t)
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
      confirm-kill-emacs (quote yes-or-no-p)
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

(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(autoload 'epa "epa-file-mode" t)
(epa-file-enable)
;;(setq paren-dont-touch-blink t)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(global-subword-mode 1)
(setq tramp-default-method "ssh")

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


(use-package exec-path-from-shell
  :ensure exec-path-from-shell
  :init (progn
          (when (memq window-system '(mac ns))
            (exec-path-from-shell-initialize))))

(use-package mic-paren
  :ensure mic-paren
  :init (paren-activate)
  :config (progn
            (setq paren-match-face 'paren-face-match)
            (setq paren-sexp-mode t)))

(use-package inline-string-rectangle)

;; ;;;; multiple-cursors
(use-package multiple-cursors
  :ensure multiple-cursors
  :defer t
  :init (progn
          (global-set-key (kbd "C-x r t") 'inline-string-rectangle)
          (global-set-key (kbd "C->") 'mc/mark-next-like-this)
          (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
          (global-set-key (kbd "C-*") 'mc/mark-all-like-this)))

;;;; rainbow-delimeters
(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


(use-package highlight-symbol
  :ensure highlight-symbol
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
  :ensure flx-ido
  :defer t
  :init (progn
          (flx-ido-mode 1)
          (setq gc-cons-threshold 20000000)
          (setq ido-enable-flex-matching t)
          (setq ido-use-faces nil)))


(use-package saveplace
  :ensure saveplace
  :init (progn (setq-default save-place t)
               (setq save-place-file (expand-file-name ".places" user-emacs-directory))))

(use-package recentf
  :ensure recentf
  :init (progn
          (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
          (recentf-mode t)
          (setq recentf-max-saved-items 1000)
          (setq recentf-max-menu-items 50)
          (add-to-list 'recentf-exclude "\\.revive\\'")
          (add-to-list 'recentf-exclude "elpa")))


(use-package fancy-narrow
  :ensure fancy-narrow
  :defer t
  :init (fancy-narrow-mode))

(use-package smex
  :ensure smex
  :init (progn
          (smex-initialize)
          (global-set-key (kbd "M-x") 'smex)))

(use-package smartscan
  :ensure smartscan
  :defer t
  :init (add-hook 'prog-mode-hook 'smartscan-mode))

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


(use-package easy-kill
  :ensure easy-kill
  :defer t
  :init (global-set-key [remap kill-ring-save] 'easy-kill))


(use-package hungry-delete
  :ensure hungry-delete
  :defer t
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

(use-package font-lock+
  :ensure  font-lock+)

;; (use-package auto-dim-other-buffers
;;   :init (auto-dim-other-buffers-mode t))

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
  :ensure  wrap-region
  :init (progn
          ;; wrap-region
          (wrap-region-global-mode +1)
          ;; add wrappers
          (wrap-region-add-wrapper "`" "`")
          (wrap-region-add-wrapper "{" "}")))

(use-package ag
  :ensure ag)

(use-package ace-jump-mode
  :ensure  ace-jump-mode
  :defer t
  :init (define-key global-map (kbd "C-c SPC") 'ace-jump-mode))

;; (use-package ace-isearch
;;   :ensure ace-isearch
;;   :defer t
;;  :init (global-ace-isearch-mode +1))

(use-package expand-region
  :ensure  expand-region
  :defer t
  :init (global-set-key (kbd "M-2") 'er/expand-region))

(use-package visual-regexp
  :ensure  visual-regexp
  :defer t
  :init (progn
          (define-key global-map (kbd "C-c r") 'vr/replace)
          (define-key global-map (kbd "C-c q") 'vr/query-replace)
          ;; if you use multiple-cursors, this is for you:
          (define-key global-map (kbd "C-c m") 'vr/mc-mark)))

(use-package re-builder
  :ensure  re-builder
  :defer t
  :init (setq reb-re-syntax 'string))

(display-time-mode -1)

(setq browse-kill-ring-separator
      "--------------------------------------------------------------------------------")

(defun my/replace-blank-kill (args)
  (let ((string (car args))
        (replace (cdr args))
        (last (car-safe kill-ring)))
    (when (and last (string-blank-p last))
      (setq replace t))
    (list string replace)))

(advice-add 'kill-new :filter-args #'my/replace-blank-kill)

(use-package guide-key
  :ensure guide-key
  :init (progn
          (setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
          (setq guide-key/highlight-command-regexp "register")
            (guide-key-mode 1) ))

;; (use-package wakatime-mode
;;   :ensure wakatime-mode
;;   :init (progn
;;           (setq wakatime-api-key "378d5540-75fa-415f-8a20-51aac381b1ac")
;;           (setq wakatime-cli-path "/usr/local/bin/wakatime")
;;           (setq wakatime-python-bin "/usr/local/bin/python")
;;           (global-wakatime-mode)))

(provide 'basic-settings)
