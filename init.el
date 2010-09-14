(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))

(set-scroll-bar-mode 'right)
(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(ido-mode t)
(setq ido-create-new-buffer 'always)
(setq backup-inhibited t)
(global-linum-mode 1)
(setq linum-format "%3d  ")

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq default-indicate-empty-lines t)

;; Clear the backups mess
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.backup_for_emacs"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)




;; IBUFFER Settings
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-use-header-line t)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("ogórki" (name . "\\.feature\$"))
               ("dired" (mode . dired-mode))
               ("Org" (mode . org-mode))
               ("TERMINAL" (name . "^\\*terminal\\*$"))
               ("ruby" (mode . ruby-mode))
               ("javascript" (name . "\\.js.erb$\\|.js$"))
               ("haml" (mode . haml-mode))
               ("elisp" (name . "\\.el\$"))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*anything\\*$")
                         (name . "^\\*WoMan-Log\\*$")
                         (name . "^\\*Messages\\*$")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
  (save-excursion
    (set-buffer "*Ibuffer*")
    (toggle-read-only 0)
    (goto-char 1)
    (search-forward "-\n" nil t)
    (delete-region 1 (point))
    (let ((window-min-height 1))
      ;; save a little screen estate
      (shrink-window-if-larger-than-buffer))
    (toggle-read-only)))


(global-unset-key [?\C-x ?\C-z])
(global-set-key [f1] 'menu-bar-mode)
(global-set-key (kbd "C-z") 'undo)
;;BOOKMARKS
(define-key global-map [f9] 'bookmark-jump)
(define-key global-map [f10] 'bookmark-set)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-,") 'comment-or-uncomment-region)
(global-set-key (kbd "M-l") 'highlight-lines-matching-regexp)
(global-set-key (kbd "M-o") 'occur)
(global-set-key [(meta g)] 'goto-line)
(global-set-key "\C-a" 'beginning-of-line-text)
(defun my-ibuffer ()
    "Open ibuffer with cursour pointed to most recent buffer name"
    (interactive)
    (let ((recent-buffer-name (buffer-name)))
      (ibuffer)
      (ibuffer-jump-to-buffer recent-buffer-name)))
  (global-set-key [(f12)] 'my-ibuffer)
(global-set-key [f11] 'switch-full-screen)


(defun duplicate-line ()
  "*Insert a copy of the current line below the current line."
  (interactive)
  (save-excursion
    (let ((start (progn (beginning-of-line) (point)))
          (end (progn (end-of-line) (point))))
      (insert ?\n)
      (insert-buffer-substring (current-buffer) start end))))

(global-set-key (kbd "C-c d") 'duplicate-line)

;; install wmctrl (sudo apt-get install wmctrl)
(defun switch-full-screen ()
  "Switch emacs to full screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
