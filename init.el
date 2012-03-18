(require 'cl)

;;(setq debug-on-error t)

(defvar set-directories t)
(defvar set-loadpaths t)
(defvar set-use-marmelade t)
(defvar set-line-highlighting t)
(defvar set-environment-settings t)
(defvar set-java-paths-on-windows t)
(defvar set-working-on-bdj t)
(defvar set-indent-before-saving t)
(defvar set-remove-blinking-from-cursos t)
(defvar set-use-color-theme t)
(defvar use-deft t)
(defvar use-org-mode t)
(defvar on-windows (eq system-type 'windows-nt))
(defvar use-im-mode-bindings nil)
(defvar use-recentf-mode t)
(defvar show-line-numbers nil)

(when set-use-marmelade
  (require 'package)
  (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))

  (defvar my-packages '(autopair markdown-mode yaml-mode haml-mode magit gist textmate
                                 autopair haskell-mode rainbow-mode coffee-mode
                                 rinari ruby-mode inf-ruby ruby-compilation rinari deft
                                 yasnippet find-file-in-project android-mode flymake-ruby
                                 rvm yasnippet jump color-theme rainbow-delimiters
                                 idle-highlight-mode feature-mode marmalade))

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(when set-directories (message "Setting directories..")
      (setq dotfiles-dir "~/.emacs.d")
      (setq imoryc-dir (concat dotfiles-dir "/imoryc"))
      (add-to-list 'load-path imoryc-dir))

(when set-loadpaths (message "Setting load paths for libraries")
      (require 'yasnippet)
      (yas/initialize)
      (setq yas/root-directory (concat dotfiles-dir "/snippets"))
      (yas/load-directory yas/root-directory)
      (yas/load-directory "~/.emacs.d/elpa/yasnippet-0.6.1/snippets")
      (setq yas/trigger-key "TAB")

      (add-to-list 'load-path (concat imoryc-dir "/themes"))

      (require 'flymake)
      (global-set-key (kbd "C-c e") 'flymake-display-err-menu-for-current-line)
      (global-set-key (kbd "C-c n") 'flymake-goto-next-error)
      (add-hook 'find-file-hook 'flymake-find-file-hook)
      (require 'flymake-ruby) (add-hook 'ruby-mode-hook 'flymake-ruby-load)
      (require 'autopair)
      (autopair-global-mode)

      (push '(font-backend xft x) default-frame-alist)

      (require 'find-file-in-tags)
      (global-set-key (read-kbd-macro "C-,") 'find-file-in-tags)

      (require 'highlight-indentation)
      (require 'ido)
      (ido-mode 'both) ;; for buffers and files

      (require 'rainbow-delimiters)
      (global-rainbow-delimiters-mode)

      (require 'rainbow-mode)
      (rainbow-mode)

      (require 'rinari)
      (setq rinari-tags-file-name "TAGS")

      (require 'feature-mode)
      (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
      (load-file (concat imoryc-dir "/ruby-setup.el"))
      (load-file (concat imoryc-dir "/mo-git-blame.el"))
      (load-file (concat imoryc-dir "/java-setup.el"))

      (defun idle-coding-hook ()
        (idle-highlight-mode t))

      (add-hook 'emacs-lisp-mode-hook 'idle-coding-hook)
      (add-hook 'ruby-mode-hook 'idle-coding-hook)
      (add-hook 'javascript-mode-hook 'idle-coding-hook)
      (add-hook 'matlab-mode-hook 'idle-coding-hook)
      (add-hook 'rhtml-mode-hook 'idle-coding-hook)
      (add-hook 'java-mode-hook 'idle-coding-hook)

      (require 'epa)
      (epa-file-enable)
      (require 'haml-mode)
      (require 'rvm)
      (rvm-use "ruby-1.9.2" "jobandtalent")
      (require 'markdown-mode)
      (require 'find-file-in-project)
      (add-to-list 'ffip-patterns "*.java")
      (add-to-list 'ffip-patterns "*.erb")
      (add-to-list 'ffip-patterns "*.js")
      (add-to-list 'ffip-patterns "*.css")
      (add-to-list 'ffip-patterns "*.yml")

      (add-to-list 'load-path (concat dotfiles-dir "/coffee-mode"))
      (require 'coffee-mode)

      (require 'textmate)
      (textmate-mode)

      (require 'keyfreq)
      (keyfreq-mode 1)
      (keyfreq-autosave-mode 1)

      (require 'uniquify)
      (setq
       uniquify-buffer-name-style 'post-forward
       uniquify-separator "@")

      (load-file (concat imoryc-dir "/rake-setup.el"))
      (load-file (concat imoryc-dir "/project-top.el"))
      (load-file (concat imoryc-dir "/compile-mode-options.el"))
      (load-file (concat imoryc-dir "/window-manage.el"))
      (load-file (concat imoryc-dir "/enhanced_toggle.el"))
      (load-file (concat imoryc-dir "/testing.el"))
      ;;(require 'matlab)


      (require 'magit)
      (require 'android-mode))

(when use-deft
  (add-to-list 'load-path (concat dotfiles-dir "/deft"))
  (require 'deft)
  (setq deft-use-filename-as-title t)
  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-auto-save-interval 2.3)
  (if on-windows
      (setq deft-directory "C:/Users/Ignacy/Dropbox/notes/deft/")
    (setq deft-directory "~/Dropbox/notes/deft/"))
  )

(when use-org-mode
  (require 'org-install)
  (if on-windows
      (setq org-default-notes-file "C:/Users/Ignacy/Dropbox/notes/notes.org")
    (setq org-default-notes-file "~/Dropbox/notes/notes.org"))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
           "* TODO %?\n  %i\n  %a")))
  (setq org-agenda-files (quote ("~/Dropbox/notes/deft")))
  (setq org-clock-persist 'history)
  (setq org-src-fontify-natively t)
  (setq org-refile-use-outline-path 'file)
  (org-babel-do-load-languages
   'org-babel-load-languages '((ruby . t) (R . t)))
  (setq org-refile-targets '((org-agenda-files . (:level . 1))))
  (org-clock-persistence-insinuate))

(when set-use-color-theme
  ;;(load-theme 'deeper-blue))
  (load-file (concat imoryc-dir "/themes/color-theme-tomorrow.el"))
  (color-theme-tomorrow-night))

(when set-environment-settings
  (load-file (concat imoryc-dir "/im-basic-settings.el")))


(when set-line-highlighting
  (global-hl-line-mode 1)
  ;;(set-face-background 'hl-line "#333")
  ;;(set-face-background 'hl-line "#eee")
  (set-face-foreground 'highlight nil)
  (set-face-attribute hl-line-face nil :overline nil)
  (set-face-attribute hl-line-face nil :underline nil))


(when set-remove-blinking-from-cursos
  (and (fboundp 'blink-cursor-mode) (blink-cursor-mode (- (*) (*) (*)))))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun renamefile (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive (list (completing-read "New name: " nil nil nil (buffer-name))))
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(setq path-to-ctags "/usr/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name))))
;; ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor

(when show-line-numbers
  (global-linum-mode 1)
  (setq linum-format " %3d  "))

(setq x-select-enable-clipboard t)

(defvar compile-command "rake ") ; set the default make command



(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

;; IBUFFER Settings
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-formats '((mark modified read-only " "
                              (name 30 30 :left :elide)
                              " " filename-and-process)))

(setq ibuffer-use-header-line t)
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("TERMINAL" (name . "^\\*terminal\\*$"))
               ("middleware" (filename . "/code/middleware/"))
               ("fyre" (filename . "/code/webapp/"))
               ("ruby" (mode . ruby-mode))
               ("javascript" (name . "\\.js.erb$\\|.js$"))
               ("ogórki" (name . "\\.feature\$"))
               ("dired" (mode . dired-mode))
               ("Org" (mode . org-mode))
               ("haml" (mode . haml-mode))
               ("elisp" (name . "\\.el\$"))))))

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

;; install wmctrl (sudo apt-get install wmctrl)
(defun switch-full-screen ()
  "Switch emacs to full screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

(lambda ()
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string
             (regexp-quote isearch-string)))))

(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(setq cursor-in-non-selected-windows nil)


(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))


(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

(require 'etags)
(defun ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
            (unless (integerp x)
              (push (prin1-to-string x t) tag-names)))
          tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

(when use-recentf-mode
  (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
  ;; enable recent files mode.
  (require 'recentf)
  (recentf-mode t)
  (setq recentf-max-saved-items 500)
  (add-to-list 'recentf-exclude "\\.revive\\'")

  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting"))))

(defalias 'qrr 'query-replace-regexp)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.java\" | etags -l java -" dir-name)))
;;p find . -name "*.cpp" -print -or -name "*.h" -print | xargs etags
(setq tags-revert-without-query t)

(defun im/set-fonts ()
  (interactive)
  (condition-case nil
      (set-frame-font "Inconsolata-g-10")
    (error nil)))
(im/set-fonts)
;; ;;(set-face-attribute 'default nil :font "Consolas-12")
;; ;;(set-face-attribute 'default nil :font "Mono Dyslexic-13")

(when on-windows
  (add-hook 'comint-output-filter-functions
            'shell-strip-ctrl-m nil t)
  (add-hook 'comint-output-filter-functions
            'comint-watch-for-password-prompt nil t)
  (setenv "PATH" (concat "c:/bin;" (getenv "PATH")))
  (setq exec-path (cons "c:/bin/" exec-path)))

(defadvice shell-command (around shell-command-unique-buffer activate compile)
  (if (or current-prefix-arg
          (not (string-match "[ \t]*&[ \t]*\\'" command)) ;; background
          (bufferp output-buffer)
          (stringp output-buffer))
      ad-do-it ;; no behavior change

    ;; else we need to set up buffer
    (let* ((command-buffer-name
            (format "*background: %s*"
                    (substring command 0 (match-beginning 0))))
           (command-buffer (get-buffer command-buffer-name)))

      (when command-buffer
        ;; if the buffer exists, reuse it, or rename it if it's still in use
        (cond ((get-buffer-process command-buffer)
               (set-buffer command-buffer)
               (rename-uniquely))
              ('t
               (kill-buffer command-buffer))))
      (setq output-buffer command-buffer-name)

      ;; insert command at top of buffer
      (switch-to-buffer-other-window output-buffer)
      (insert "Running command: " command
              "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")

      ;; temporarily blow away erase-buffer while doing it, to avoid
      ;; erasing the above
      (ad-activate-regexp "erase-buffer-noop")
      ad-do-it
      (ad-deactivate-regexp "erase-buffer-noop"))))


(setq auto-save-default nil)
;;(set-face-background 'modeline "#001A4C")

;; Diff/git addons
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ido-first-match ((t (:foreground "#ccff66"))))
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 '(ido-indicator ((t (:foreground "#ffffff"))))
 '(ido-only-match ((t (:foreground "#ffcc33"))))
 '(ido-subdir ((t (:foreground "#66ff00")))))
(setq redisplay-dont-pause t)

;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; load key-bindings
(load-file (concat imoryc-dir "/im-helpers.el"))
(load-file (concat imoryc-dir "/im-keys.el"))
(load-file (concat imoryc-dir "/im-modeline.el"))
(load-file (concat imoryc-dir "/im-abbrevs.el"))

(require 'ansi-color)

(defun im/shell-mode-hook ()
  (setq show-trailing-whitespace nil)
  (setq shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*"))

(add-hook 'shell-mode-hook 'im/shell-mode-hook)
(add-hook 'term-mode-hook 'im/shell-mode-hook)

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))

(defadvice switch-to-buffer (before existing-buffer
                                    activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg)))))
