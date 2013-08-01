(global-set-key [(control h)] 'delete-backward-char)

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

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(bind "C-c f" 'ns-toggle-fullscreen)

;; Completion that uses many different methods to find options.
(bind "C-;" 'hippie-expand-no-case-fold)
      (bind "C-:" 'hippie-expand-lines)
      (bind "C-," 'completion-at-point)

      (global-set-key (kbd "M-j")
                      (lambda ()
                        (interactive)
                        (join-line -1)))

      ;; Move more quickly
      (global-set-key (kbd "C-S-n")
                      (lambda ()
                        (interactive)
                        (ignore-errors (next-line 5))))

      (global-set-key (kbd "C-S-p")
                      (lambda ()
                        (interactive)
                        (ignore-errors (previous-line 5))))

      (global-set-key (kbd "C-S-f")
                      (lambda ()
                        (interactive)
                        (ignore-errors (forward-char 5))))

      (global-set-key (kbd "C-S-b")
                      (lambda ()
                        (interactive)
                        (ignore-errors (backward-char 5))))

      (bind "M-r" 'emamux:send-command)
      (bind "M-z" 'undo)
      (bind "M-s m" 'multi-occur-in-this-mode)
      ;; (bind "C-c n" 'clean-up-buffer-or-region)
      (bind "C-c q" 'whitespace-mode)
      (bind "C-x i" 'indent-region-or-buffer)
      (bind "C-c TAB" 'align-regexp)
      (bind "C-x C-i" 'imenu)
      (bind "C-x C-r" 'ido-recentf-open)
      (bind "M-h" 'backward-kill-word)
      (bind "C-x C-o" 'other-window)
      (bind "C-x C-1" 'delete-other-windows)
      (bind "C-," 'find-tag-at-point)
      (bind "M-," 'find-tag-at-point)
      (bind "C-S-o" 'move-line-up)
      (bind "C-o" 'open-line-above)
      (bind "C-S-j" 'move-line-down)
      (bind "C-j" 'newline-and-indent)
      (bind "C-@" 'er/expand-region)

      ;; Smart M-x
      (bind "M-x" 'smex)

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

      (bind "M-i" 'back-to-indentation)

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
