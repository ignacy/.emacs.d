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


(bind "<f8>" 'deft)
;;(bind "<f5>" 'im/ant)
(bind "C-x C-r" 'ido-recentf-open)
(bind "C-c C-d" 'im/diff-current-buffer-with-disk)
(bind "C-q" 'jw-run-test-or-spec-file)
(bind "<f2>" 'find-file-in-project)
(bind "C-c l" 'goto-line)
(bind "M-s-/" 'align)
(bind "C-l" 'recenter)
(bind "M-h" 'backward-kill-word)
(bind "M-z" 'undo)
(bind "C-x C-o" 'other-window)
(bind "C-x C-1" 'delete-other-windows)
(bind "C-a" 'back-to-indentation)
(bind "C-x C-f" 'ido-find-file)
(bind "C-x f" 'textmate-goto-file)
(bind "M-t" 'im/open-todo)
(bind "C-x i" 'iwb)
(bind "C-x C-p" 'find-file-at-point)
(bind "C-3" 'split-window-horizontally)
(bind "C-2" 'split-window-vertically)
(bind "C-1" 'switch-to-zsh)
(bind "C-M-s" 'isearch-other-window)
(bind "M-," 'tags-search)
(bind "M-?" 'tags-loop-continue)
(bind "<f6>" magit-status)
(bind "C-x k" 'im/kill-current-buffer)
(bind "M-%" 'replace-regexp)
(bind "C-." 'ido-find-file-in-tag-files)
(bind "M-\\" 'jump-to-mark)
(bind "C-\\" 'push-mark-no-activate)
(bind "M-s" 'ido-goto-symbol)
(bind "C-'" 'textmate-goto-symbol)
(bind "C-<tab>" 'bs-show)
(bind "C-x C-b" 'ido-switch-buffer)
;;(bind "C-x C-b" 'anything-for-buffers)
(bind "M-g" 'goto-line)
(bind "C-x b" 'ibuffer-bs-show)
(bind "<f11>" 'switch-full-screen)
(bind "M-/" 'hippie-expand)
(bind "M-," 'comment-or-uncomment-region)
(bind "M-." 'anything-c-etags-select)
(bind "M-l" 'highlight-lines-matching-regexp)
;; (bind "M-p" 'smart-symbol-go-backward)
;; (bind "M-n" 'smart-symbol-go-forward)
(bind "M-p" 'previous-line)
(bind "M-n" 'next-line)

(bind "<f1>" 'help)
(bind "C-x C-x" 'clipboard-kill-region)
(bind "M-m" iy-go-to-char)
(bind "M-u" 'toggle-letter-case)
(bind "C-c h" 'highlight-indentation-mode)
;;(bind "C-c t" 'my-ido-find-tag)
(bind "C-i" 'indent-for-tab-command)

(keyboard-translate ?\C-h ?\C-?)
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x 2"))
                                        ;m(global-unset-key [?\C-x ?\C-z])
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(meta delete)] 'backward-kill-word)
(bind "C-x q" 'bookmark-set)
(bind "C-x g" 'bookmark-jump)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-unset-key (kbd "<backspace>"))
(global-unset-key (kbd "RET"))

(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))

(bind "<up>" 'scroll-n-lines-behind)
(bind "<down>" 'scroll-n-lines-ahead)


(global-set-key (kbd "M-]") 'jw-indent-block)
(global-set-key (kbd "M-[") 'jw-outdent-block)
;;; C-C t * -- Testing Commands
(global-set-key (kbd "C-C t F")   'jw-run-last-test-or-spec-file)
(global-set-key (kbd "C-C t M")   'jw-run-last-test-or-spec-method)
(global-set-key (kbd "C-C t c")   'jw-run-test-cruise)
(global-set-key (kbd "C-C t f")   'jw-run-test-or-spec-file)
(global-set-key (kbd "C-C t i")   'jw-run-test-integration)
(global-set-key (kbd "C-C t l")   'jw-run-test-functionals)
(global-set-key (kbd "C-C t m")   'jw-run-test-or-spec-method)
(global-set-key (kbd "C-C t r")   'jw-run-test-rake)
(global-set-key (kbd "C-C t s")   'toggle-style)
(global-set-key (kbd "C-C t t")   'jw-mark-for-testing)
(global-set-key (kbd "C-C t u")   'jw-run-test-units)
(global-set-key (kbd "C-C t w")   'jw-test-toggle-warnings)

(global-set-key (kbd "C-C t C-f") 'jw-run-last-test-or-spec-file)
(global-set-key (kbd "C-C t C-m") 'jw-run-last-test-or-spec-method)
(global-set-key (kbd "C-C t C-t") 'etog-clear-buffer-styles)
(global-set-key (kbd "C-C t C-s") 'toggle-debug)

(global-set-key (kbd "C-C g c") 'mo-git-blame-current)
(global-set-key (kbd "C-C g f") 'mo-git-blame-file)

(global-set-key (kbd "C-C t 1") (lambda () (interactive) (setq jw-test-single-window t))) ; pkg:testing
(global-set-key (kbd "C-C t 2") (lambda () (interactive) (setq jw-test-single-window nil))) ; pkg:testing
