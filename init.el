(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))


(load-file (concat dotfiles-dir "/haskell-mode/haskell-site-file.el"))


(setq ditaa-cmd "java -jar /home/ignacy/bin/ditaa0_9.jar")
(defun djcb-ditaa-generate ()
  (interactive)
  (shell-command
    (concat ditaa-cmd " " buffer-file-name)))

(set-scroll-bar-mode 'right)
(setq visible-bell t)
(show-paren-mode 1)
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


(load-file (concat imoryc-dir "/markdown-mode.el"))
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t) 
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))


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
;; (global-hl-line-mode 1)
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



;;; Setup rails
(add-to-list 'load-path (concat dotfiles-dir "/emacs-rails-reloaded"))
(add-to-list 'load-path (concat dotfiles-dir "/inf-ruby-2.1"))
(require 'rails-autoload)
(add-to-list 'load-path (concat dotfiles-dir "/rhtml"))
(require 'rhtml-mode)


;;yassnippet
(add-to-list 'load-path (concat dotfiles-dir "/yasnippet-0.6.1c"))
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/yasnippet-0.6.1c/snippets"))

(require 'org-install)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-font-lock-mode 1)                     ; for all buffers
(transient-mark-mode 1)
(org-remember-insinuate)
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(("Todo" ?t "* TODO %? %^g\n %i\n" (concat org-directory "/notes.org") "Tasks")
        ("Journal" ?j "\n* %^{topic} %T \n%i%?\n" (concat org-directory "/notes.org") "Journal")
        ("Notes" ?n "* %U %?\n\n  %i\n %a"(concat org-directory "/notes.org") "Note")
        ("Idea" ?i "* %^{Title}\n  %i\n  %a" (concat org-directory "/notes.org") "New Ideas")))
(add-hook 'org-mode-hook
          (lambda ()
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)))


(setq 
  bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
  bookmark-save-flag 1)                        ;; autosave each change)

(define-key global-map [f9] 'bookmark-jump)
(define-key global-map [f10] 'bookmark-set)


;;AUTOCOMPLETE
(add-to-list 'load-path (concat dotfiles-dir "/auto-complete-1.3"))
(require 'auto-complete-config)
(ac-config-default)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
(setq rsense-home "/home/ignacy/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))


;; (add-to-list 'load-path (concat dotfiles-dir "/color-theme-6.6.0"))
;; (load-file (concat imoryc-dir "/colors/color-theme-g0sub.el"))
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-g0sub)))

(setq font-use-system-font t)

(require 'flymake)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))
	     ))


