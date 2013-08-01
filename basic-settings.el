(autoload 'epa "epa-file-mode" t)
(epa-file-enable)

(set-frame-parameter (selected-frame) 'alpha '(99 90))
(add-to-list 'default-frame-alist '(alpha 99 90))

(show-paren-mode t)
(setq show-paren-style 'mixed)

(setq scroll-margin 0 croll-conservatively 100000 scroll-preserve-screen-position 1)
(setq auto-save-default nil)
(setq initial-scratch-message nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)

(transient-mark-mode 1) ;; No region when it is not highlighted
(delete-selection-mode t)
(setq make-backup-files nil)

(display-time-mode -1)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Easily navigate sillycased words
(global-subword-mode 1)

(defun setup-fonts-and-size ()
  (interactive)
  ;;;; GUI settings
  (when (display-graphic-p)
    (fringe-mode 1)
    (mouse-wheel-mode t)
    ;;(menu-bar-mode t)
    (setq-default mac-option-modifier 'super)
    (setq-default mac-pass-command-to-system nil)

    ;;(set-face-attribute 'default nil :family "Source Code Pro" :height 140)
    (add-to-list 'initial-frame-alist '(left . 1))
    (add-to-list 'initial-frame-alist '(top . 1))))

(setup-fonts-and-size)


;; mac friendly font
(when window-system
  (setq im/default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  (setq im/presentation-font "-apple-Monaco-medium-normal-normal-*-28-*-*-*-m-0-iso10646-1")
  (set-face-attribute 'default nil :font im/default-font))


(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq inhibit-startup-screen t)
(setq
 bookmark-default-file "~/.bookmarks_emacs" ;; keep my ~/ clean
 bookmark-save-flag 1)                        ;; autosave each change)
(setq x-select-enable-clipboard t)
(setq confirm-nonexistent-file-or-buffer nil)
;; (global-hl-line-mode 1)
;; ;;(set-face-background 'hl-line "light cyan")
;; ;;(set-face-background 'hl-line "#444")
;; (set-face-foreground 'highlight nil)
;; (set-face-foreground 'hl-line nil)
(fringe-mode '(0 . 0))

(global-auto-revert-mode 1)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

(setq enable-recursive-minibuffers t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq visible-bell t)
(setq delete-by-moving-to-trash t trash-directory "~/.Trash/emacs")
;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

(provide 'basic-settings)
