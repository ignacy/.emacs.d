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

(bind "C-s" 'isearch-forward-regexp)
(bind "C-r" 'isearch-backward-regexp)

;; Completion that uses many different methods to find options.
(bind "C-:" 'hippie-expand-no-case-fold)
(bind "C-;" 'hippie-expand-lines)
(bind "C-," 'completion-at-point)

(bind "M-r" 'helm-git-grep)
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)

(bind "M-z" 'undo)
(bind "M-s m" 'multi-occur-in-this-mode)
(bind "C-x f" 'fiplr-find-file)

(bind "C-c q" 'toggle-quotes)
(bind "C-x i" 'indent-region-or-buffer)
(bind "C-c TAB" 'align-regexp)
(bind "C-x C-i" 'imenu)
(bind "C-x C-r" 'ido-recentf-open)

(bind "M-h" 'backward-kill-word)
(bind "C-x C-o" 'other-window)
(bind "C-x C-1" 'delete-other-windows)
(bind "C-," 'find-tag-at-point)
(bind "C-c t" 'find-tag-at-point)

(bind "C-x C-f" 'ido-find-file)
(bind "C-x C-p" 'find-file-at-point)
(bind "C-1" 'switch-to-zsh)
(bind "C-x k" 'im/kill-current-buffer)
(bind "M-%" 'replace-regexp)
(bind "C-c e" 'replace-string)
(bind "C-'" 'helm-imenu)
(bind "C-<tab>" 'switch-to-previous-buffer)
(bind "C-x C-b" 'ido-switch-buffer)
(bind "C-x b" 'helm-buffers-list)
(bind "M-g" 'goto-line-with-feedback)
(bind "C-c h" 'helm-projectile)
(bind "M-/" 'hippie-expand)
(bind "M-u" 'toggle-letter-case)
(bind "S-<left>" 'shrink-window-horizontally)
(bind "S-<right>" 'enlarge-window-horizontally)
(bind "S-<up>" 'shrink-window)
(bind "S-<down>" 'enlarge-window)
(bind "C-j" 'newline-and-indent)
(bind "C-o" 'open-line-below)
(bind "C-S-o" 'open-line-above)

(bind "C-c d" (lambda()
                (interactive)
                (find-file "~/Dropbox/notes/index.org")))
(bind "C-c a" 'org-agenda)
(bind "C-x g" 'magit-status)
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1))) 

(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [mode-line mouse-2] 'ignore)
(global-set-key [(meta delete)] 'backward-kill-word)

(provide 'keys)
