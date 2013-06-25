(require 'epa)
(epa-file-enable)

(setq blink-matching-paren t)
(show-paren-mode 1)
(setq show-paren-delay 0)
;; allow scroll-down/up-command to move point to buffer end/beginning
(setq scroll-error-top-bottom 'true)
(setq scroll-step 1)
(setq auto-window-vscroll nil)
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1)
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

;;;; GUI settings
(when (display-graphic-p)
  (fringe-mode 1)
  (mouse-wheel-mode t)
  ;;(menu-bar-mode t)
  (setq-default mac-option-modifier 'super)
  (setq-default mac-pass-command-to-system nil)

  (set-face-attribute 'default nil
                      :family "Source Code Pro"
                      :height 145)
  ;; specify a unicode font : MENLO (forced normal)
  ;; for the height, subtract a couple hundred pixels
  ;; from the screen height (for panels, menubars and
  ;; whatnot), then divide by the height of a char to
  ;; get the height we want
  ;; (set-frame-size (selected-frame) 0 0)
  ;; (add-to-list 'initial-frame-alist '(top . 10))
  ;; (add-to-list 'initial-frame-alist '(left . 30))
  ;; (set-frame-size (selected-frame))
  ;; (set-frame-size (selected-frame) )
  (add-to-list 'initial-frame-alist '(left . 1))
  (add-to-list 'initial-frame-alist '(top . 1)))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(setq
 bookmark-default-file "~/.bookmarks_emacs" ;; keep my ~/ clean
 bookmark-save-flag 1)                        ;; autosave each change)
(setq x-select-enable-clipboard t)
(setq confirm-nonexistent-file-or-buffer nil)
(global-hl-line-mode 1)
;;(set-face-background 'hl-line "light cyan")
;;(set-face-background 'hl-line "#444")
(set-face-foreground 'highlight nil)
(set-face-foreground 'hl-line nil)
(setq-default fill-column 100)
(fringe-mode '(0 . 0))
(global-auto-revert-mode 1)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq visible-bell t)
(setq delete-by-moving-to-trash t trash-directory "~/.Trash/emacs")
;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

(provide 'basic-settings)
