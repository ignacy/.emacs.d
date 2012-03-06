(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(icomplete-mode t)
(make-variable-buffer-local 'compile-command)
;;(setq-default indent-tabs-mode nil)
(setq redisplay-dont-pause t)
(setq indent-tabs-mode nil)
(setq tab-width 2)
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
(setq-default indent-tabs-mode nil)
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
(define-abbrev-table 'global-abbrev-table '(
                                            ("firend" "friend" nil 0)
                                            ("Firend" "Friend" nil 0)))
(setq save-abbrevs nil)
(setq-default fill-column 80)
(setq-default scroll-step              1
              scroll-conservatively    most-positive-fixnum
              scroll-up-aggressively   0.0
              scroll-down-aggressively 0.0)
(set-face-background 'fringe "#0C1021")
(fringe-mode '(1 . 0))
(set-cursor-color '"#00ff00")

(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially try-complete-file-name
                                         try-expand-all-abbrevs try-expand-list try-expand-line
                                         try-complete-lisp-symbol-partially try-complete-lisp-symbol))
(global-auto-revert-mode 1)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq explicit-shell-file-name "/bin/zsh")
(set-face-background 'highlight-indentation-face "#232323")
(set-face-background 'highlight-indentation-current-column-face "#f3f3f3")
(highlight-indentation-mode)

