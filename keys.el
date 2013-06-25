(global-set-key [(control h)] 'delete-backward-char)

;; This are key bindings that I use
(defmacro bind (key fn)
  "shortcut for global-set-key"
  `(global-set-key (kbd ,key)
                   ;; handle unquoted function names and lambdas
                   ,(if (listp fn)
                        fn
                      `',fn)))

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(bind "C-c f" 'ns-toggle-fullscreen)
(bind "M-z" 'undo)
;; (bind "C-c n" 'clean-up-buffer-or-region)
(bind "C-c q" 'whitespace-mode)
(bind "C-M-\\" 'indent-region-or-buffer)
(bind "C-c TAB" 'align-regexp)
(bind "C-x C-i" 'imenu)
(bind "C-x C-r" 'ido-recentf-open)
(bind "M-h" 'backward-kill-word)
(bind "C-x C-o" 'other-window)
(bind "C-x C-1" 'delete-other-windows)
(bind "C-," 'find-tag-at-point)
(bind "C-S-o" 'move-line-up)
(bind "C-o" 'open-line-above)
(bind "C-S-j" 'move-line-down)
(bind "C-j" 'newline-and-indent)
(bind "C-=" 'er/expand-region)

(bind "C-x C-f" 'ido-find-file)
(bind "C-x f" 'projectile-find-file)
(bind "C-x C-p" 'find-file-at-point)
;;(bind "C-1" 'switch-to-zsh)
(bind "C-M-s" 'isearch-other-window)
(bind "C-x k" 'im/kill-current-buffer)
(bind "M-%" 'replace-regexp)

(bind "M-\\" 'jump-to-mark)
(bind "C-\\" 'push-mark-no-activate)

(bind "C-'" 'textmate-goto-symbol)
(bind "C-<tab>" 'switch-to-previous-buffer)
(bind "C-x b" 'ido-switch-buffer)
(bind "M-g" 'goto-line-with-feedback)
(bind "C-x C-b" 'projectile-switch-to-buffer)

(defun run-file-or-spec ()
  "If we're in a spec file - run rspec; in other case use quickrun"
  (interactive)
  (let ((file-name-ending (substring (file-name-nondirectory (buffer-file-name)) -8 nil)))
    (if (string= "_spec.rb" file-name-ending)
        (rspec-verify)
      (quickrun))))

(bind "M-/" 'hippie-expand)

(bind "<f14>" 'run-file-or-spec)
(bind "<f13>" 'projectile-grep)
(bind "<f1>" 'help)

(bind "M-u" 'toggle-letter-case)

(bind "S-<left>" 'shrink-window-horizontally)
(bind "S-<right>" 'enlarge-window-horizontally)
(bind "S-<up>" 'shrink-window)
(bind "S-<down>" 'enlarge-window)

(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

(keyboard-translate ?\C-h ?\C-?)

(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(meta delete)] 'backward-kill-word)
(bind "C-x g" 'magit-status)
(bind "<up>" 'scroll-n-lines-behind)
(bind "<down>" 'scroll-n-lines-ahead)

(provide 'keys)
