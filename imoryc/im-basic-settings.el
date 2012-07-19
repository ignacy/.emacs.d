(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(icomplete-mode t)
(make-variable-buffer-local 'compile-command)
(setq-default indent-tabs-mode nil)
(setq redisplay-dont-pause t)
(setq-default tab-width 2)
(setq default-indicate-empty-lines t)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(transient-mark-mode 1) ;; No region when it is not highlighted
(delete-selection-mode t)
(set-default 'cursor-type 'box)
(setq comment-style 'indent)
(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(setq cursor-in-non-selected-windows t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ido-create-new-buffer 'always)
(setq backup-inhibited t)
(setq font-lock-maximum-decoration t)
(display-time-mode -1)
(setq
 bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
 bookmark-save-flag 1)                        ;; autosave each change)

(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
(put 'set-goal-column 'disabled nil)
(setq auto-save-default nil)
;; Diff/git addons
(custom-set-faces
 '(diff-added ((t (:foreground "Green"))) 'now)
 '(diff-removed ((t (:foreground "Red"))) 'now)
 )

(setq-default fill-column 100)
(setq-default scroll-step              1
              scroll-conservatively    most-positive-fixnum
              scroll-up-aggressively   0.0
              scroll-down-aggressively 0.0)

;;(set-face-background 'fringe "#0C1021")
(set-face-background 'fringe "SteelBlue4")

(fringe-mode '(1 . 0))
(set-cursor-color '"#00ff00")

(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)

;; (setq hippie-expand-try-functions-list '(try-expand-dabbrev
;;                                          try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
;;                                          try-complete-file-name-partially try-complete-file-name
;;                                          try-expand-all-abbrevs try-expand-list try-expand-line
;;                                          try-complete-lisp-symbol-partially try-complete-lisp-symbol))
(global-auto-revert-mode 1)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq explicit-shell-file-name "/bin/zsh")

(defvar ash-mark-bol
  (save-excursion
    (goto-char (or (mark) (point)))
    (forward-line 0)
    (point-marker))
  "Marker from `beginning-of-line' for for `mark'.")

(defun ash-mark-hook-fun ()
  "Run with `activate-mark-hook'."
  (let ((mark-bol-posn (save-excursion
                         (goto-char (mark))
                         (forward-line 0)
                         (point))))
    (if (markerp ash-mark-bol)
        (set-marker ash-mark-bol mark-bol-posn)
      (setq ash-mark-bol
            (save-excursion
              (goto-char mark-bol-posn)
              (point-marker))))))

(add-to-list 'activate-mark-hook 'ash-mark-hook-fun)
(setq overlay-arrow-position ash-mark-bol)

(load-file (concat imoryc-dir "/im-modeline.el"))
(setq visible-bell t)





