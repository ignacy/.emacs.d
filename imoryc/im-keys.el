(global-set-key [(control h)] 'delete-backward-char)

;; This are key bindings that I use
(defmacro bind (key fn)
  "shortcut for global-set-key"
  `(global-set-key (kbd ,key)
                   ;; handle unquoted function names and lambdas
                   ,(if (listp fn)
                        fn
                      `',fn)))

(bind "<f8>" 'deft)
(bind "<f5>" 'im/ant)
(bind "M-]" 'forward-paragraph)
(bind "M-[" 'backward-paragraph)
(bind "C-x C-r" 'ido-recentf-open)
(bind "C-c C-d" 'im/diff-current-buffer-with-disk)
(bind "C-q" 'jw-run-test-or-spec-file)
(bind "<f2>" 'find-file-in-project)
(bind "C-c l" 'goto-line)
(bind "M-s-/" 'align)
(bind "C-l" 'textmate-select-line)
(bind "M-h" 'backward-kill-word)
(bind "M-z" 'undo)
(bind "C-a" 'back-to-indentation)
(bind "C-x C-f" 'ido-find-file)
(bind "M-t" 'im/open-todo)
(bind "C-x i" 'iwb)
(bind "C-3" 'split-window-horizontally)
(bind "C-2" 'split-window-vertically)
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
(bind "C-x b" 'ido-switch-buffer)
(bind "<f11>" 'switch-full-screen)
(bind "M-/" 'hippie-expand)
(bind "M-," 'comment-or-uncomment-region)
(bind "M-l" 'highlight-lines-matching-regexp)
(bind "M-o" 'occur)
(bind "M-n" 'smart-symbol-go-forward)
(bind "M-p" 'smart-symbol-go-backward)
(bind "<f1>" 'help)
(bind "C-v" 'clipboard-yank)
(bind "C-x C-x" 'clipboard-kill-region)
(bind "M-m" iy-go-to-char)
(bind "<f12>" 'persp-switch)
(bind "M-o" 'textmate-goto-file)

;; (global-unset-key (kbd "C-n"))
;; (global-unset-key (kbd "C-p"))
;; (bind "M-i" 'previous-line) ; was tab-to-tab-stop
;; (bind "M-j" 'backward-char) ; was indent-new-comment-line
;; (bind "M-k" 'next-line) ; was kill-sentence
;; (bind "M-l" 'forward-char)  ; was downcase-word
;; (bind "M-SPC" 'set-mark-command) ; was just-one-space

(bind "M-u" 'toggle-letter-case)
      
(keyboard-translate ?\C-h ?\C-?)
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x 2"))
(global-unset-key [?\C-x ?\C-z])
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(meta delete)] 'backward-kill-word)
(define-key global-map [f9] 'bookmark-jump)
(define-key global-map [f10] 'bookmark-set)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(windmove-default-keybindings 'meta)
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "C-x f"))

;;; This is something I tried I'm not sure it is a good idea..
(when use-im-mode-bindings
  (global-unset-key (kbd "C-x 2"))
  (global-unset-key (kbd "C-x 3"))
  (global-unset-key (kbd "C-x 0"))
  (global-unset-key (kbd "C-n"))
  (global-unset-key (kbd "C-p"))
  (global-unset-key (kbd "<up>"))
  (global-unset-key (kbd "<down>"))
  (global-unset-key (kbd "<left>"))
  (global-unset-key (kbd "<right>"))


  (defvar im-keys-minor-mode-map (make-keymap) "im-keys-minor-mode keymap.")
  """ Some of my keuybindings placed in minor mode to make sure they are not overriden"
  (define-key im-keys-minor-mode-map (kbd "M-i") 'previous-line)
  (define-key im-keys-minor-mode-map (kbd "M-j") 'backward-char) ; was indent-new-comment-line
  (define-key im-keys-minor-mode-map (kbd "M-k") 'next-line) ; was kill-sentence
  (define-key im-keys-minor-mode-map (kbd "M-l") 'forward-char) ; was downcase-word
  (define-key im-keys-minor-mode-map (kbd "M-g") 'kill-line)
  (define-key im-keys-minor-mode-map (kbd "M-o") 'forward-word)
  (define-key im-keys-minor-mode-map (kbd "M-u") 'backward-word)
  (define-key im-keys-minor-mode-map (kbd "M-s") 'isearch-forward-regexp)
  (define-key im-keys-minor-mode-map (kbd "M-[") 'forward-paragraph)
  (define-key im-keys-minor-mode-map (kbd "M-]") 'backward-paragraph)
  (define-key im-keys-minor-mode-map (kbd "C-2") 'split-window-below)
  (define-key im-keys-minor-mode-map (kbd "C-3") 'split-window-right)
  (define-key im-keys-minor-mode-map (kbd "C-0") 'delete-window)
  (define-key im-keys-minor-mode-map (kbd "C-x C-b") 'switch-to-buffer)
  (define-key im-keys-minor-mode-map (kbd "C-h") 'backward-kill-word)

  (define-key im-keys-minor-mode-map (kbd "M-SPC") 'set-mark-command) ; was just-one-space


  (define-minor-mode im-keys-minor-mode
    "A minor mode so that im key settings override annoying major modes."
    t " im-keys" 'im-keys-minor-mode-map)

  (im-keys-minor-mode 1)

  (defun im-minibuffer-setup-hook ()
    (im-keys-minor-mode 0))

  (add-hook 'minibuffer-setup-hook 'im-minibuffer-setup-hook))

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'im-keys-minor-mode))
      (let ((mykeys (assq 'im-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'im-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)
