(setq visible-bell t
      show-paren-style 'mixed
      scroll-margin 0
      croll-conservatively 100000
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
      delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"
      ispell-program-name "/usr/local/bin/aspell"
      enable-recursive-minibuffers t)

(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 2


(autoload 'epa "epa-file-mode" t)
(epa-file-enable)

;; (set-frame-parameter (selected-frame) 'alpha '(99 90))
;; (add-to-list 'default-frame-alist '(alpha 99 90))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(transient-mark-mode 1) ;; No region when it is not highlighted
(delete-selection-mode t)
(display-time-mode -1)
(global-subword-mode 1)

(when (display-graphic-p)
  (mouse-wheel-mode t)
  ;;(menu-bar-mode t)
  (setq-default mac-option-modifier 'super)
  (setq-default mac-pass-command-to-system nil))


(defun font-when-not-connected ()
  """ This font settings are supposed to be used when I am not connected
      to a separate display"""
      (interactive)
      (when (display-graphic-p)
        (setq im/default-font "-apple-Source_Code_Pro-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
        (set-face-attribute 'default nil :font im/default-font)))

(defun font-when-connected ()
  (interactive)
  (when (display-graphic-p)
    (setq im/default-font "-apple-Source_Code_Pro-medium-normal-normal-*-15-*-*-*-m-0-iso10646-1")
    (set-face-attribute 'default nil :font im/default-font)))

(font-when-connected)


(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(fringe-mode '(0 . 0))

;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(global-auto-revert-mode 1)

(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)
(provide 'basic-settings)
