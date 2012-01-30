(require 'cl)

;;(setq debug-on-error t)

;; By setting any of the below to nil
;; you are dissabling the whole section
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

;; (when on-windows
;;   (setenv "HOME" "C:/Users/Ignacy/"))

(setq explicit-shell-file-name "/bin/zsh")

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


(custom-set-variables
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output t) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 '(comint-completion-autolist t)        ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space/slash after file completion
 )
;; shell-mode
(defun sh ()
  (interactive)
  (ansi-term "/bin/zsh"))

(when set-use-marmelade

  (require 'package)
  (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)


  (when (not package-archive-contents)
    (package-refresh-contents))

  (defvar my-packages '(autopair markdown-mode yaml-mode haml-mode magit gist textmate
                                 fuzzy-match autopair perspective haskell-mode
                                 yasnippet find-file-in-project android-mode flymake-ruby
                                 auto-complete rvm yasnippet jump findr
                                 idle-highlight-mode feature-mode marmalade))

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(when set-directories (message "Setting directories..")
      ;; (if on-windows
      ;;     (progn
      ;;       (setq dotfiles-dir "C:/Users/Ignacy/.emacs.d"))
      ;;   (setq dotfiles-dir "~/.emacs.d"))
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

      (load-file (concat imoryc-dir "/ruby-setup.el"))
      (load-file (concat imoryc-dir "/java-setup.el"))


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
      (require 'auto-complete-config)
      (ac-config-default)

      (load-file (concat imoryc-dir "/iy-go-to-char.el"))
      (require 'iy-go-to-char)

      (load-file (concat imoryc-dir "/rake-setup.el"))
      (load-file (concat imoryc-dir "/project-top.el"))
      (load-file (concat imoryc-dir "/testing.el"))
      (load-file (concat imoryc-dir "/matlab.el"))

      (require 'ido)
      (ido-mode 'both) ;; for buffers and files

      (unless on-windows
        ;; Rinari
        (add-to-list 'load-path (concat dotfiles-dir "/rinari"))
        (require 'rinari)
        (setq rinari-tags-file-name "TAGS"))

      (require 'feature-mode)
      (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
      (load-file (concat imoryc-dir "/ruby-setup.el"))
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
      (require 'git-blame)
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

      (require 'perspective)
      (persp-mode)


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
       uniquify-separator ":")

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
  (setq dotfiles-dir "C:/Users/Ignacy/.emacs.d")
  (setq org-clock-persist 'history)
  (setq org-src-fontify-natively t)
  (org-clock-persistence-insinuate))

(when set-use-color-theme
  ;; (if window-system
  ;;     (load-theme 'callouscrab)
  ;;   (load-theme 'wombat)))
  (load-file (concat imoryc-dir "/themes/afterthought-theme.el")))

(defun im/go ()
  "Set settings on emacsclient"
  (interactive)
  (load-theme 'deeper-blue)
  (im/set-fonts)
  )


(when set-environment-settings
  (setq initial-scratch-message nil)
  (setq inhibit-splash-screen t)
  (icomplete-mode t)
  (setq font-lock-maximum-decoration t)
  (display-time-mode -1)
  (setq inhibit-startup-message t))

(when set-line-highlighting
  (global-hl-line-mode 1)
  ;;(set-face-background 'hl-line "#333")
  ;;(set-face-background 'hl-line "#eee")
  (set-face-foreground 'highlight nil)
  (set-face-foreground 'hl-line nil))

(when set-java-paths-on-windows
  (when on-windows
    (setenv "JUNIT_HOME" "/home/ignacy/code/classpath")
    (setenv "JAVA_HOME" "c://jdk1.6.0_23")
    (setenv "CLASSPATH" "$CLASSPATH:$JUNIT_HOME:/home/ignacy/code/classpath:/home/ignacy/code/FyreTv/lib/test/testng-5.14.7.jar")))

(unless on-windows
  (defcustom android-mode-sdk-dir "~/android"
    "Set to the directory containing the Android SDK."
    :type 'string
    :group 'android-mode))

(when on-windows
  (defcustom android-mode-sdk-dir "c:/Android/android-sdk/"
    "Set to the directory containing the Android SDK."
    :type 'string
    :group 'android-mode))


(defcustom android-mode-avd "@htc"
  "Default AVD to use."
  :type 'string
  :group 'android-mode)

(unless on-windows
  (defun ant-compile ()
    "Traveling up the path, find build.xml file and run compile."
    (interactive)
    (with-temp-buffer
      (while (and (not (file-exists-p "build.xml"))
                  (not (equal "/" default-directory)))
        (cd ".."))
      (call-interactively 'compile))))

(when set-working-on-bdj
  (defvar bdj-root "C://Users//Ignacy//code//FyreTv")
  (defun im/ant (task)
    "Run ant TASK in the project root directory."
    (interactive "sTask name: ")
    (cd bdj-root)
    (compile (concat "ant " task))))

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

(when window-system
  (scroll-bar-mode -1))

(setq cua-enable-cua-keys nil)
(cua-mode)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(delete-selection-mode t)
(set-default 'cursor-type 'box)

(setq comment-style 'indent)
(setq comment-style 'indent)
(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(setq cursor-in-non-selected-windows nil)
(setq-default indent-tabs-mode nil)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(defvar smart-use-extended-syntax nil
  "If t the smart symbol functionality will consider extended
syntax in finding matches, if such matches exist.")

(defvar smart-last-symbol-name ""
  "Contains the current symbol name.

This is only refreshed when `last-command' does not contain
either `smart-symbol-go-forward' or `smart-symbol-go-backward'")

(make-local-variable 'smart-use-extended-syntax)

(defvar smart-symbol-old-pt nil
  "Contains the location of the old point")

(defun smart-symbol-goto (name direction)
  "Jumps to the next NAME in DIRECTION in the current buffer.

DIRECTION must be either `forward' or `backward'; no other option
is valid."

  ;; if `last-command' did not contain
  ;; `smart-symbol-go-forward/backward' then we assume it's a
  ;; brand-new command and we re-set the search term.
  (unless (memq last-command '(smart-symbol-go-forward
                               smart-symbol-go-backward))
    (setq smart-last-symbol-name name))
  (setq smart-symbol-old-pt (point))
  (message (format "%s scan for symbol \"%s\""
                   (capitalize (symbol-name direction))
                   smart-last-symbol-name))
  (unless (catch 'done
            (while (funcall (cond
                             ((eq direction 'forward) ; forward
                              'search-forward)
                             ((eq direction 'backward) ; backward
                              'search-backward)
                             (t (error "Invalid direction"))) ; all others
                            smart-last-symbol-name nil t)
              (unless (memq (syntax-ppss-context
                             (syntax-ppss (point))) '(string comment))
                (throw 'done t))))
    (goto-char smart-symbol-old-pt)))

(defun smart-symbol-go-forward ()
  "Jumps forward to the next symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'end) 'forward))

(defun smart-symbol-go-backward ()
  "Jumps backward to the previous symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'beginning) 'backward))

(defun smart-symbol-at-pt (&optional dir)
  "Returns the symbol at point and moves point to DIR (either `beginning' or `end') of the symbol.

If `smart-use-extended-syntax' is t then that symbol is returned
instead."
  (with-syntax-table (make-syntax-table)
    (if smart-use-extended-syntax
        (modify-syntax-entry ?. "w"))
    (modify-syntax-entry ?_ "w")
    (modify-syntax-entry ?- "w")
    ;; grab the word and return it
    (let ((word (thing-at-point 'word))
          (bounds (bounds-of-thing-at-point 'word)))
      (if word
          (progn
            (cond
             ((eq dir 'beginning) (goto-char (car bounds)))
             ((eq dir 'end) (goto-char (cdr bounds)))
             (t (error "Invalid direction")))
            word)
        (error "No symbol found")))))


;; '(setq visible-bell t)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ido-create-new-buffer 'always)
(setq backup-inhibited t)
(global-linum-mode 1)
(setq linum-format " %3d  ")

(setq x-select-enable-clipboard t)


(defvar compile-command "rake ") ; set the default make command
(make-variable-buffer-local 'compile-command)
                                        ; make the compile command buffer local
                                        ; (this allows each buffer to have its
                                        ; own custom compile command)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq default-indicate-empty-lines t)



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

(defun my-ibuffer ()
  "Open ibuffer with cursour pointed to most recent buffer name"
  (interactive)
  (let ((recent-buffer-name (buffer-name)))
    (ibuffer)
    (ibuffer-jump-to-buffer recent-buffer-name)))

(defun duplicate-line ()
  "*Insert a copy of the current line below the current line."
  (interactive)
  (save-excursion
    (let ((start (progn (beginning-of-line) (point)))
          (end (progn (end-of-line) (point))))
      (insert ?\n)
      (insert-buffer-substring (current-buffer) start end))))

(defun copy-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (next-line 1)
  )


;; install wmctrl (sudo apt-get install wmctrl)
(defun switch-full-screen ()
  "Switch emacs to full screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

(setq
 bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
 bookmark-save-flag 1)                        ;; autosave each change)



;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                           (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)


(unless on-windows
  (setq rsense-home "/home/ignacy/bin/rsense-0.3")
  (add-to-list 'load-path (concat rsense-home "/etc"))
  (require 'rsense)
  (add-to-list 'ac-sources 'ac-source-rsense-method)
  (add-to-list 'ac-sources 'ac-source-rsense-constant)
  )

(lambda ()
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string
             (regexp-quote isearch-string)))))


(setq font-lock-maximum-decoration t)

(icomplete-mode t)

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
  (setq recentf-max-saved-items 80)
  (add-to-list 'recentf-exclude "\\.revive\\'")

  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting"))))

(add-hook 'java-mode-hook (lambda () (subword-mode)))

(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

(defalias 'qrr 'query-replace-regexp)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.java\" | etags -l java -" dir-name)))
;;p find . -name "*.cpp" -print -or -name "*.h" -print | xargs etags
(setq tags-revert-without-query t)


(put 'set-goal-column 'disabled nil)
(defun isearch-other-window ()
  """ Search in other window without movign there """
  (interactive)
  (save-selected-window
    (other-window 1)
    (isearch-forward)))


(defun im/set-fonts ()
  (interactive)
  (condition-case nil
      (set-face-attribute 'default nil :font "Inconsolata-g-10")
    (error nil)))
;; ;;(set-face-attribute 'default nil :font "Consolas-12")
;; ;;(set-face-attribute 'default nil :font "Mono Dyslexic-13")



(when on-windows
  (add-hook 'comint-output-filter-functions
            'shell-strip-ctrl-m nil t)
  (add-hook 'comint-output-filter-functions
            'comint-watch-for-password-prompt nil t)
  ;; (setq explicit-shell-file-name "zsh")
  ;; (setq explicit-sh-args '("-l" "-i"))
  ;; For subprocesses invoked via the shell
  ;; (e.g., "shell -c command")
  ;; (setq shell-file-name explicit-shell-file-name)
  (setenv "PATH" (concat "c:/bin;" (getenv "PATH")))
  (setq exec-path (cons "c:/bin/" exec-path))
  ;;(require 'cygwin-mount)
                                        ;(cygwin-mount-activate)
  )

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defadvice erase-buffer (around erase-buffer-noop)
  "make erase-buffer do nothing")

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
 '(diff-added ((t (:foreground "Green"))) 'now)
 '(diff-removed ((t (:foreground "Red"))) 'now)
 )


(setq redisplay-dont-pause t)

;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(define-abbrev-table 'global-abbrev-table '(
                                            ("firend" "friend" nil 0)
                                            ("Firend" "Friend" nil 0)))
(setq save-abbrevs nil)
(setq-default fill-column 80)

(setq-default scroll-step              1
              scroll-conservatively    most-positive-fixnum
              scroll-up-aggressively   0.0
              scroll-down-aggressively 0.0)

;; load key-bindings
(load-file (concat imoryc-dir "/im-helpers.el"))
(load-file (concat imoryc-dir "/im-keys.el"))
(load-file (concat imoryc-dir "/im-modeline.el"))
(load-file (concat imoryc-dir "/im-abbrevs.el"))
;; Make colours in Emacs' shell look normal
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Don't auto-truncate lines in shell mode
(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))
(set-face-background 'fringe "#0C1021")
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "bash")
(fringe-mode '(1 . 0))

;;(setq-default cursor-type '(bar . 1))
(set-cursor-color '"#00ff00")

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially try-complete-file-name
                                         try-expand-all-abbrevs try-expand-list try-expand-line
                                         try-complete-lisp-symbol-partially try-complete-lisp-symbol))
(global-auto-revert-mode 1)
