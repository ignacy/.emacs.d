(require 'cl)

;;(setq debug-on-error t)

(defvar set-loadpaths t)
(defvar set-line-highlighting t)
(defvar set-environment-settings t)
(defvar set-java-paths-on-windows t)
(defvar set-working-on-bdj t)
(defvar set-indent-before-saving t)
(defvar set-remove-blinking-from-cursos t)
(defvar set-use-color-theme nil)
(defvar use-deft t)
(defvar use-rsense t)
(defvar use-org-mode t)
(defvar on-windows (eq system-type 'windows-nt))
(defvar use-im-mode-bindings nil)
(defvar use-recentf-mode t)
(defvar show-line-numbers nil)

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(require 'package)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(autopair markdown-mode yaml-mode haml-mode magit gist textmate
                               autopair haskell-mode rainbow-mode coffee-mode js2-mode
                               rinari ruby-mode inf-ruby ruby-compilation rinari deft
                               find-file-in-project android-mode flymake-ruby yasnippet
                               rvm  jump color-theme rainbow-delimiters ruby-end
                               idle-highlight-mode feature-mode marmalade))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-blue)

;;(load-file (concat imoryc-dir "/themes/color-theme-molokai.el"))
;;(load-file (concat imoryc-dir "/themes/afterthought-theme.el")))
;;  (color-theme-molokai))



(when set-loadpaths (message "Setting load paths for libraries")
      (require 'ruby-end)

      (require 'yasnippet)
      (yas/initialize)
      (setq yas/root-directory (concat dotfiles-dir "/snippets"))
      (yas/load-directory yas/root-directory)
      (yas/load-directory "~/.emacs.d/elpa/yasnippet-0.6.1/snippets")
      (setq yas/trigger-key "TAB")

      (add-to-list 'load-path (concat imoryc-dir "/themes"))

      (autoload 'espresso-mode "espresso")

      ;; (require 'autopair)
      ;; (autopair-global-mode)

      ;;(push '(font-backend xft x) default-frame-alist)

      (require 'find-file-in-tags)
      (global-set-key (read-kbd-macro "C-,") 'find-file-in-tags)

      ;;(require 'highlight-indentation)
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

      (load-file (concat imoryc-dir "/java-setup.el"))


      (defun idle-coding-hook ()
        (idle-highlight-mode t))

      (defun set-javascript()
        (setq autopair-mode nil))

      (add-hook 'emacs-lisp-mode-hook 'idle-coding-hook)
      (add-hook 'ruby-mode-hook 'idle-coding-hook)
      (add-hook 'js2-mode-hook 'idle-coding-hook)
      (add-hook 'js2-mode-hook 'set-javascript)
      (add-hook 'matlab-mode-hook 'idle-coding-hook)
      (add-hook 'rhtml-mode-hook 'idle-coding-hook)
      (add-hook 'java-mode-hook 'idle-coding-hook)

      (autoload 'js2-mode "js2-mode" nil t)
      (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

      (require 'epa)
      (epa-file-enable)
      (require 'haml-mode)
      (require 'rvm)
      (rvm-use "ruby-1.9.3" "jobandtalent")
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
      (load-file (concat imoryc-dir "/testowanie.el"))
      ;;(require 'matlab)


      (require 'magit)
      (require 'android-mode))


(when use-rsense
  (setq rsense-home "~/bin/rsense-0.3")
  (add-to-list 'load-path (concat rsense-home "/etc"))
  (require 'rsense))




(global-set-key (kbd "M-[") 'smart-up)
(global-set-key (kbd "M-]") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

;; (require 'inline-string-rectangle)
;; (global-set-key (kbd "C-x r t") 'inline-string-rectangle)

;; (require 'mark-more-like-this)
;; (global-set-key (kbd "C-<") 'mark-previous-like-this)
;; (global-set-key (kbd "C->") 'mark-next-like-this)
;; (global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
;; (global-set-key (kbd "C-*") 'mark-all-like-this)

(when use-deft
  (add-to-list 'load-path (concat dotfiles-dir "/deft"))
  (require 'deft)
  (setq deft-use-filename-as-title t)
  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-auto-save-interval 2.3)
  (setq deft-directory "~/Dropbox/notes/deft/"))

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                                    sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                                    html-mode nxml-mode sh-mode clojure-mode
                                    lisp-mode textile-mode markdown-mode
                                    js3-mode css-mode less-css-mode))
  (add-to-list 'ac-modes mode))


(ac-config-default)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))


(when use-org-mode
  (require 'org-install)
  (setq org-directory "~/Dropbox/notes")
  (setq org-default-notes-file "~/Dropbox/notes/notes.org")
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/Dropbox/notes/flagged.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/MobileOrg")

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
           "* TODO %?\n  %i\n  %a")))
  (setq org-agenda-files (quote ("~/Dropbox/notes/deft")))
  (setq org-clock-persist 'history)
  (setq org-src-fontify-natively t)
  (setq org-refile-use-outline-path 'file)
  ;; (org-babel-do-load-languages
  ;;  'org-babel-load-languages '((ruby . t) (R . t)))
  (setq org-refile-targets '((org-agenda-files . (:level . 1))))
  (org-clock-persistence-insinuate)
  (define-key global-map "\C-cc" 'org-capture))


(setq inferior-lisp-program "lein repl")
(add-hook 'sldb-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate )))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t)))



(when set-environment-settings
  (load-file (concat imoryc-dir "/im-basic-settings.el")))


(require 'ace-jump-mode)
(define-key global-map (kbd "C-§") 'ace-jump-mode)

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

(require 'yaml-mode)
(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(defun ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (let ((properties (text-properties-at (point))))
    (when (and
           (memq 'font-lock-string-face properties)
           (save-excursion
             (ruby-forward-string "\"" (line-end-position) t)))
      (insert "{}")
      (backward-char 1))))
(define-key ruby-mode-map (kbd "#") 'ruby-interpolate)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(require 'ruby-compilation)
(require 'ruby-end)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(add-to-list 'load-path (concat dotfiles-dir "/rhtml"))
(require 'rhtml-mode)

;; (flymake-ruby-load)
;; (ruby-end-mode)

;; (add-hook 'ruby-mode-hook 'flymake-ruby-load)
(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist t)
(setq ruby-deep-indent-paren t)
(setq ruby-insert-encoding-magic-comment nil)
;;(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
(setq tab-width 2)

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.

;; Ruby test unit patterns.
(add-to-list 'compilation-error-regexp-alist
             '("\\([^ \t:\\[]+\\):\\([0-9]+\\):in" 1 2))
(add-to-list 'compilation-error-regexp-alist
             '("test[a-zA-Z0-9_]*([A-Z][a-zA-Z0-9_]*) \\[\\(.*\\):\\([0-9]+\\)\\]:" 1 2))


(defface erb-face
  `((t (:background "grey")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)

(defface erb-delim-face
  `((t (:background "grey9")))
  "Default inherited face for ERB tag delimeters"
  :group 'rhtml-faces)

(defface erb-out-delim-face
  `((t (:inherit erb-delim-face :weight bold :foreground "yellow")))
  "Basic face for Ruby embedded into HTML"
  :group 'rhtml-faces)

(defface erb-exec-delim-face
  `((t (:inherit erb-delim-face :weight bold :foreground "yellow")))
  "Basic face for Ruby embedded into HTML"
  :group 'rhtml-faces)

(require 'project-top)

(defvar rubydb-command-name ''rvm--emacs-ruby-binary
  "File name for executing ruby.")

(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))


(when set-line-highlighting
  (global-hl-line-mode 1)
  ;;(set-face-background 'hl-line "light cyan")
  (set-face-background 'hl-line "#444")
  (set-face-foreground 'highlight nil)
  (set-face-foreground 'hl-line nil)
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
      ;; -apple-Menelo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1
      (set-frame-font "Menlo-14")
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

;; Diff/git addons
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red")))))
(setq redisplay-dont-pause t)

;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

;; load key-bindings
(load-file (concat imoryc-dir "/im-helpers.el"))
(load-file (concat imoryc-dir "/im-keys.el"))
(load-file (concat imoryc-dir "/im-abbrevs.el"))

(require 'ansi-color)

(defun im/shell-mode-hook ()
  (setq show-trailing-whitespace nil)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil)
  (message "Running im/shell mode hook")
  (hl-line-mode nil))

(add-hook 'shell-mode-hook 'im/shell-mode-hook)
(add-hook 'term-mode-hook 'im/shell-mode-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun zsh ()
  (interactive)
  (shell "zsh"))

(defun spork ()
  (interactive)
  (shell "spork"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))



(load-file (concat imoryc-dir "/shell-parse.el"))

(defadvice switch-to-buffer (before existing-buffer
                                    activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg)))))

(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))


(defun my-js2-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 2)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
  (define-key js2-mode-map [(meta control \;)]
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ]----- */"))
       ))
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map [(control meta q)] 'my-indent-sexp)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (message "My JS2 hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)

;; (define-clojure-indent
;;   (defroutes 'defun)
;;   (GET 2)
;;   (POST 2)
;;   (PUT 2)
;;   (DELETE 2)
;;   (HEAD 2)
;;   (ANY 2)
;;   (context 2))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
 (put 'narrow-to-region 'disabled nil)
 '(js2-auto-indent-p nil)
 '(js2-basic-offset 2)
 '(js2-cleanup-whitespace t))


(ns-toggle-fullscreen)
