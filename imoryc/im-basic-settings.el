;; Cursor
(blink-cursor-mode t)
(setq initial-frame-alist
      (cons '(cursor-type . bar) (copy-alist initial-frame-alist)))
(setq default-frame-alist
      (cons '(cursor-type . bar) (copy-alist default-frame-alist)))

(setq auto-save-default nil)
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
;;(and (fboundp 'blink-cursor-mode) (blink-cursor-mode (- (*) (*) (*))))
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4)

(display-time-mode -1)
(setq
 bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
 bookmark-save-flag 1)                        ;; autosave each change)
(setq x-select-enable-clipboard t)

(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(set-frame-font "Menlo-14")
(setq cursor-in-non-selected-windows nil)

(setq redisplay-dont-pause t)


(global-hl-line-mode 1)
;;(set-face-background 'hl-line "light cyan")
;;(set-face-background 'hl-line "#444")
(set-face-foreground 'highlight nil)
(set-face-foreground 'hl-line nil)
(set-face-attribute hl-line-face nil :overline nil)
(set-face-attribute hl-line-face nil :underline nil)


(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
(put 'set-goal-column 'disabled nil)
(setq auto-save-default nil)

(setq-default fill-column 100)
(setq-default scroll-step              1
              scroll-conservatively    most-positive-fixnum
              scroll-up-aggressively   0.0
              scroll-down-aggressively 0.0)

;;(set-face-background 'fringe "#0C1021")
(set-face-background 'fringe "SteelBlue4")

(fringe-mode '(1 . 0))
(set-cursor-color '"#00ff00")

(require 'whitespace)
(setq whitespace-style '(trailing lines lines-tail space-before-tab indentation empty space-after-tab))
(setq-default show-trailing-whitespace t)
(setq-default default-indicate-empty-lines t)
(setq-default whitespace-line-column 80)

(custom-set-faces
 '(trailing-whitespace
   ((((class color)
      (background light))
     (:background "cyan")))))


(global-auto-revert-mode 1)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

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


(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(require 'init-idle-highlight)
(idle-highlight-mode)


;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator "@")
(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(provide 'im-basic-settings)
