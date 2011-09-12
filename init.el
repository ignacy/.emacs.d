(message "Ok. let's do some configuring..")
(require 'cl)

;; By setting any of the below to nil
;; you are dissabling the whole section
(defvar set-directories t)
(defvar set-loadpaths t)
(defvar set-line-highlighting t)
(defvar set-environment-settings t)
(defvar set-java-paths-on-windows t)
(defvar set-working-on-bdj t)
(defvar set-use-key-chords nil)
(defvar set-indent-before-saving t)
(defvar set-remove-blinking-from-cursos t)
(defvar set-use-color-theme t)
(defvar use-deft t)
;; Helper variables to recognize the environment
(defvar on-windows
  (eq system-type 'windows-nt))


(when set-directories (message "Setting directories..")
      (if on-windows
          (progn
            (message "Running windows.. using AppData/Roaming")
            (setq dotfiles-dir "C:/Users/Ignacy/AppData/Roaming/.emacs.d"))
        (message "We're not on windows..")
        (setq dotfiles-dir "~/.emacs.d"))
      (setq imoryc-dir (concat dotfiles-dir "/imoryc"))
      (add-to-list 'load-path imoryc-dir))

(when set-loadpaths (message "Setting load paths for libraries")
      (add-to-list 'load-path (concat dotfiles-dir "/emacs-rails-reloaded"))
      (require 'rails-autoload)

      (add-to-list 'load-path (concat imoryc-dir "/themes"))

      (load-file (concat imoryc-dir "/ruby-setup.el"))

      (add-to-list 'load-path (concat dotfiles-dir "/autopair"))
      (require 'autopair)
      (autopair-global-mode)

      (load-file (concat imoryc-dir "/rake-setup.el"))
      (load-file (concat imoryc-dir "/project-top.el"))
      (load-file (concat imoryc-dir "/testing.el"))

      (require 'modeline-posn)
      (setq-default fill-column 80)
      (setq modelinepos-column-limit 80)
      (column-number-mode 1)
      (size-indication-mode 1)

      (add-to-list 'load-path (concat dotfiles-dir "/magit-0.8.2"))
      (require 'magit)
      (add-to-list 'load-path "~/.emacs.d/android-mode")
      (require 'android-mode))

(when use-deft
  (add-to-list 'load-path (concat dotfiles-dir "/deft"))
  (require 'deft)
  (setq deft-extension "md")
  (setq deft-text-mode 'markdown-mode)
  (global-set-key [f8] 'deft)
  (if on-windows
      (setq deft-directory "C:/Users/Ignacy/Dropbox/notes")
    (setq deft-directory "~/Dropbox/notes"))
  )


(when set-use-color-theme
  (enable-theme 'solarized-light))

;; require can begin here
(require 'anything-config)
(require 'anything-etags+)

;; ;;(global-set-key (kbd "M-a") 'anything)
(global-set-key "\M-." 'anything-etags+-select-one-key)


(defmacro bind (key fn)
  "shortcut for global-set-key"
  `(global-set-key (kbd ,key)
                   ;; handle unquoted function names and lambdas
                   ,(if (listp fn)
                        fn
                      `',fn)))


(when set-environment-settings (message "Setting environment settings")
      (setq inhibit-startup-message t))

(when set-line-highlighting (message "Switching line highlighting on")
      (global-hl-line-mode 1)
      (set-face-background 'hl-line "#fff")
      ;;(set-face-background 'hl-line "#eee")
      (set-face-foreground 'highlight nil)
      (set-face-foreground 'hl-line nil))

(when set-java-paths-on-windows (message "Setting java paths")
      (when on-windows
        (setenv "JUNIT_HOME" "/home/ignacy/code/classpath")
        (setenv "JAVA_HOME" "c://jdk1.6.0_23")
        (setenv "CLASSPATH" "$CLASSPATH:$JUNIT_HOME:/home/ignacy/code/classpath:/home/ignacy/code/FyreTv/lib/test/testng-5.14.7.jar")))

(unless on-windows (message "Setting androidn on linux")
        (defcustom android-mode-sdk-dir "~/android"
          "Set to the directory containing the Android SDK."
          :type 'string
          :group 'android-mode))

(when on-windows (message "Setting android for windows")
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
    (compile (concat "ant " task)))
  (global-set-key [f5] 'im/ant))


(when set-use-key-chords
  (require 'key-chord)
  (key-chord-mode 1)
  (key-chord-define-global "uu" 'undo)
  (key-chord-define-global "dd" 'kill-line)
  )


;; (when set-indent-before-saving
;;   (add-hook 'before-save-hook 'iwb)
;;   )

(when set-remove-blinking-from-cursos
  (and (fboundp 'blink-cursor-mode) (blink-cursor-mode (- (*) (*) (*))))
  )


(require 'epa)
(epa-file-enable)
(require 'git-blame)
(require 'haml-mode)
(require 'rvm)

(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-q") 'jw-run-test-or-spec-file)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'list-buffers)



;; Window manipulation
(global-set-key [(control prior)] 'enlarge-window)
(global-set-key [(control next)] 'shrink-window)
(windmove-default-keybindings 'meta)

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



;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(global-set-key (kbd "C-x i") 'iwb)


(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(defadvice find-file-at-point (around goto-line compile activate)
  (let ((line (and (looking-at ".*:\\([0-9]+\\)")
                   (string-to-number (match-string 1)))))
    ad-do-it
    (and line (goto-line line))))

(setq next-line-add-newlines t)


(add-to-list 'load-path (concat dotfiles-dir "/feature-mode"))
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; (setq ditaa-cmd "java -jar /home/ignacy/bin/ditaa0_9.jar")
;; (defun djcb-ditaa-generate ()
;;   (interactive)
;;   (shell-command
;;    (concat ditaa-cmd " " buffer-file-name)))

;; (setq path-to-ctags "/usr/local/bin/ctags")
;; (defun create-tags (dir-name)
;;   "Create tags file."
;;   (interactive "DDirectory: ")
;;   (shell-command
;;    (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
;;   )

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags -L -" dir-name)))


(scroll-bar-mode -1)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(delete-selection-mode t)
(set-default 'cursor-type 'bar)
;; (set-cursor-color "yellow")



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


(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)


;; '(setq visible-bell t)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(ido-mode t)
(setq ido-create-new-buffer 'always)
(setq backup-inhibited t)

(global-linum-mode 1)
(setq linum-format " %3d  ")

;; insert current buffer name into minibuffer
(define-key minibuffer-local-map [f3]
  (lambda () (interactive)
    (insert (buffer-name (window-buffer (minibuffer-selected-window))))))

(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(meta delete)] 'backward-kill-word)

(setq x-select-enable-clipboard t)
(global-set-key [(control v)] 'clipboard-yank)
(global-set-key (kbd "C-x C-x") 'clipboard-kill-region)

(defvar compile-command "rake ") ; set the default make command
(make-variable-buffer-local 'compile-command)
                                        ; make the compile command buffer local
                                        ; (this allows each buffer to have its
                                        ; own custom compile command)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq default-indicate-empty-lines t)


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


(global-unset-key [?\C-x ?\C-z])
(global-set-key [f1] 'help)
(global-set-key (kbd "C-z") 'undo)

;; (global-hl-line-mode 1)
;;(set-face-background 'hl-line "gray8")
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
;;(global-set-key [(meta g)] 'beginning-of-buffer)
(global-set-key "\C-a" 'beginning-of-line-text)
(defun my-ibuffer ()
  "Open ibuffer with cursour pointed to most recent buffer name"
  (interactive)
  (let ((recent-buffer-name (buffer-name)))
    (ibuffer)
    (ibuffer-jump-to-buffer recent-buffer-name)))
;; (global-set-key [(f12)] 'my-ibuffer)
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

(defun copy-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (next-line 1)
  )
(global-set-key (kbd "C-l") 'copy-line)

;; install wmctrl (sudo apt-get install wmctrl)
(defun switch-full-screen ()
  "Switch emacs to full screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

;;yassnippet
(add-to-list 'load-path (concat dotfiles-dir "/yasnippet-0.6.1c"))
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/yasnippet-0.6.1c/snippets"))
(setq yas/trigger-key "TAB")

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


(unless on-windows
  (setq rsense-home "/home/ignacy/bin/rsense-0.3")
  (add-to-list 'load-path (concat rsense-home "/etc"))
  (require 'rsense)
  (add-to-list 'ac-sources 'ac-source-rsense-method)
  (add-to-list 'ac-sources 'ac-source-rsense-constant)
  )

(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))


(setq font-lock-maximum-decoration t)

(icomplete-mode t)

(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(setq cursor-in-non-selected-windows nil)
(bind "C-x g" magit-status)
(global-set-key [C-tab] 'bs-show)
;; Moje funkcje

(bind "C-c j" im/join-line)


(defun im/join-line()
  "Join with previous line but move back to next line after"
  (interactive)
  (join-line)
  (next-line))


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


(global-set-key (kbd "M-i") 'ido-goto-symbol)

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))
(global-set-key (kbd "C-\\") 'push-mark-no-activate)

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-\\") 'jump-to-mark)

(defun im/find-note (note)
  "Find note in org mode notes file"
  (interactive "sWpisz szukane slowo: ")
  (find-file "/home/ignacy/Dropbox/org/notes.org")
  (re-search-forward note)
  (point))

;; (defun im/clear-elc-files
;;   "Clear all bytecompiled emacs files"
;;   (shell-command "find ~/.emacs.d/ -name *.elc -exec rm {} \;"))



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

(global-set-key [remap find-tag] 'ido-find-tag)
(global-set-key (kbd "C-.") 'ido-find-file-in-tag-files)


(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

                                        ; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(add-hook 'before-save-hook 'whitespace-cleanup)

(add-hook 'java-mode-hook (lambda () (subword-mode)))


;; (global-set-key (kbd "<right>") 'use-emacs-keys)
;; (global-set-key (kbd "<left>") 'use-emacs-keys)
;; (global-set-key (kbd "<down>") 'use-emacs-keys)
;; (global-set-key (kbd "<up>") 'use-emacs-keys)
;; (defun use-emacs-keys ()
;;   (interactive)
;;   "Remind me to use emacs move keys not arrows!!"
;;   (message "Use emacs keys you lazy bastard!!"))


(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)


(keyboard-translate ?\C-h ?\C-?)

(global-set-key (kbd "C-c %") 'replace-regexp)
(defalias 'qrr 'query-replace-regexp)



(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.java\" | etags -l java -" dir-name)))
;;p find . -name "*.cpp" -print -or -name "*.h" -print | xargs etags
(setq tags-revert-without-query t)

(global-set-key (kbd "M-,") 'tags-search)
(global-set-key (kbd "M-?") 'tags-loop-continue)
(put 'set-goal-column 'disabled nil)

(unless (server-running-p)
  (server-start))


(defun isearch-other-window ()
  """ Search in other window without movign there """
  (interactive)
  (save-selected-window
    (other-window 1)
    (isearch-forward)))

(global-set-key (kbd "C-M-s") 'isearch-other-window)

(if on-windows
    (set-face-attribute 'default nil :font "Consolas-14")
  ;;(set-face-attribute 'default nil :font "Mono Dyslexic-13")
  (set-face-attribute 'default nil :font "Inconsolata-g-12")
  )


(when on-windows
  (add-hook 'comint-output-filter-functions
            'shell-strip-ctrl-m nil t)
  (add-hook 'comint-output-filter-functions
            'comint-watch-for-password-prompt nil t)
  (setq explicit-shell-file-name "bash.exe")
  ;; For subprocesses invoked via the shell
  ;; (e.g., "shell -c command")
  (setq shell-file-name explicit-shell-file-name)
  (setenv "PATH" (concat "c:/bin;" (getenv "PATH")))
  (setq exec-path (cons "c:/bin/" exec-path))
  (require 'cygwin-mount)
  (cygwin-mount-activate))


(add-to-list 'load-path (concat dotfiles-dir "/coffee-mode"))
(require 'coffee-mode)

(add-to-list 'load-path (concat dotfiles-dir "/textmate.el"))
(require 'textmate)
(textmate-mode)

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



(defun substitute-regexp (substitution)
  "Use s/old/new/g regexp syntax for `query-replace'."
  (interactive
   (list
    (read-from-minibuffer "Substitute regexp: " '("s///g" . 3) nil nil
                          'query-replace-history nil t)))
  (if (string-match "^s/\\(.*\\)/\\(.*\\)/\\([gi]*\\)" substitution)
      (let* ((sregex (match-string 1 substitution))
             (ssubst (match-string 2 substitution))
             (sflags (match-string 3 substitution))
             (case-fold-search (string-match "i" sflags)))
        (perform-replace
         sregex ssubst (string-match "g" sflags)
         t nil nil nil
         (if (and transient-mark-mode mark-active) (region-beginning))
         (if (and transient-mark-mode mark-active) (region-end))))
    (error "Invalid syntax")))


(bind "<f6>" magit-status)


(unless on-windows
  ;; use setq-default to set it for /all/ modes
  (setq mode-line-format
        (list
         ;; the buffer name; the file name as a tool tip
         '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                             'help-echo (buffer-file-name)))

         ;; line and column
         "(" ;; '%02' to set to 2 chars at least; prevents flickering
         (propertize "%02l" 'face 'font-lock-type-face) ","
         (propertize "%02c" 'face 'font-lock-type-face)
         ") "

         ;; relative position, size of file
         "["
         (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
         "/"
         (propertize "%I" 'face 'font-lock-constant-face) ;; size
         "] "

         ;; the current major mode for the buffer.
         "["

         '(:eval (propertize "%m" 'face 'font-lock-string-face
                             'help-echo buffer-file-coding-system))
         "] "


         "[" ;; insert vs overwrite mode, input-method in a tooltip
         '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                             'face 'font-lock-preprocessor-face
                             'help-echo (concat "Buffer is in "
                                                (if overwrite-mode "overwrite" "insert") " mode")))

         ;; was this buffer modified since the last save?
         '(:eval (when (buffer-modified-p)
                   (concat ","  (propertize "Mod"
                                            'face 'font-lock-warning-face
                                            'help-echo "Buffer has been modified"))))

         ;; is this buffer read-only?
         '(:eval (when buffer-read-only
                   (concat ","  (propertize "RO"
                                            'face 'font-lock-type-face
                                            'help-echo "Buffer is read-only"))))
         "] "

         ;; add the time, with the date and the emacs uptime in the tooltip
         '(:eval (propertize (format-time-string "%H:%M")
                             'help-echo
                             (concat (format-time-string "%c; ")
                                     (emacs-uptime "Uptime:%hh"))))
         " --"
         ;; i don't want to see minor-modes; but if you want, uncomment this:
         ;; minor-mode-alist  ;; list of minor modes
         "%-" ;; fill with '-'
         ))

  (set-face-background 'modeline "#001A4C")

  )
(custom-set-faces
 '(diff-added ((t (:foreground "Green"))) 'now)
 '(diff-removed ((t (:foreground "Red"))) 'now)
 )
