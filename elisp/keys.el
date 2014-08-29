(global-set-key [(control h)] 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)

;; This are key bindings that I use
(defmacro bind (key fn)
  "shortcut for global-set-key"
  `(global-set-key (kbd ,key)
                   ;; handle unquoted function names and lambdas
                   ,(if (listp fn)
                        fn
                      `',fn)))

(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])

;;(bind "M-r" 'helm-git-grep)
(bind "M-r" 'projectile-pt)

(bind "M-z" 'undo)
(bind "C-x i" 'indent-region-or-buffer)
(bind "C-c TAB" 'align-regexp)
(bind "C-x C-r" 'ido-recentf-open) ;; Im disabling it in favour of project based search


(bind "C-x g" 'magit-status)
(bind "M-h" 'backward-kill-word)
(bind "C-x C-o" 'other-window)
(bind "C-x C-1" 'delete-other-windows)
(bind "C-," 'find-tag-at-point)
(bind "C-x r b" 'bookmark-ido-quick-jump)
(bind "C-x C-f" 'ido-find-file)

;;(bind "C-x f" 'projectile-find-file)
(bind "C-x f" 'find-file-in-project)

(bind "C-x C-p" 'find-file-at-point)
;;(bind "C-1" 'switch-to-zsh)

(bind "C-'" 'ido-imenu)

;; Replace rectangle-text with inline-string-rectangle
(bind "C-x r t" 'inline-string-rectangle)

(bind "C-x k" 'im/kill-current-buffer)
(bind "M-%" 'replace-regexp)
(bind "C-c e" 'replace-string)
(bind "C-<tab>" 'switch-to-previous-buffer)
(bind "C-x b" 'ido-switch-buffer)
(bind "C-x C-b" 'projectile-switch-to-buffer)

(bind "M-g" 'goto-line-with-feedback)
(bind "M-/" 'hippie-expand-no-case-fold)
(bind "M-?" 'hippie-expand-lines)
(bind "M-u" 'toggle-letter-case)

(require 'windmove)
(bind "C-x <up>" 'windmove-up)
(bind "C-x <down>" 'windmove-down)
(bind "C-x <right>" 'windmove-right)
(bind "C-x <left>" 'windmove-left)

(bind "S-<left>" 'shrink-window-horizontally)
(bind "S-<right>" 'enlarge-window-horizontally)
(bind "S-<up>" 'shrink-window)
(bind "S-<down>" 'enlarge-window)
(bind "C-j" 'newline-and-indent)

(bind "M-j" 'join-lines)

(bind "C-S-o" 'move-line-up)

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [mode-line mouse-2] 'ignore)
(global-set-key [(meta delete)] 'backward-kill-word)

(global-set-key "\C-w" (make-backward-kill-word-fn backward-kill-word (1)))



(provide 'keys)
