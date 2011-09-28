;; Setup ruby

(add-to-list 'load-path (concat dotfiles-dir "/ruby-debug-extra-0.10.1"))
(add-to-list 'load-path (concat dotfiles-dir "/ruby-debug-extra-0.10.1/emacs"))
(require 'rdebug)

;;; Setup rails
(add-to-list 'load-path (concat dotfiles-dir "/emacs-rails-reloaded"))
(require 'rails-autoload)
(add-to-list 'load-path (concat dotfiles-dir "/rhtml"))
(require 'rhtml-mode)

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

(eval-after-load 'ruby-mode
  '(progn
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
     (setq tab-width 2)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")))

(global-set-key (kbd "C-h r") 'ri)

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Clear the compilation buffer between test runs.
(eval-after-load 'ruby-compilation
  '(progn
     (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
       (let ((comp-buffer-name (format "*%s*" name)))
         (when (get-buffer comp-buffer-name)
           (with-current-buffer comp-buffer-name
             (delete-region (point-min) (point-max))))))
     (ad-activate 'ruby-do-run-w/compilation)))

(add-hook 'ruby-mode-hook 'run-coding-hook)

(load-library "compile")

;;; For some reason, the gnu regex is capturing leading white space.
(setq compilation-error-regexp-alist
      (remq 'gnu compilation-error-regexp-alist))

;; Ruby test unit patterns.
(add-to-list 'compilation-error-regexp-alist
             '("\\([^ \t:\\[]+\\):\\([0-9]+\\):in" 1 2))
(add-to-list 'compilation-error-regexp-alist
             '("test[a-zA-Z0-9_]*([A-Z][a-zA-Z0-9_]*) \\[\\(.*\\):\\([0-9]+\\)\\]:" 1 2))


(defface erb-face
  `((t (:background "grey10")))
  "Default inherited face for ERB tag body"
  :group 'rhtml-faces)

(defface erb-delim-face
  `((t (:background "grey15")))
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

(defun schema ()
  "Open the schema file in this Rails project."
  (interactive)
  (project-top-find-file "db/schema.rb"))

(defun routes ()
  "Open the routes file in this Rails project."
  (interactive)
  (project-top-find-file "config/routes.rb"))

(defun gud-rubydb-find-file (f)
  (save-excursion
    (let ((buf (find-file-noselect f)))
      (set-buffer buf)
      ;;      (gud-make-debug-menu)
      buf)))

(defvar rubydb-command-name ''rvm--emacs-ruby-binary
  "File name for executing ruby.")

;;;###autoload

(defun rubydb (command-line)
  "Run rubydb on program FILE in buffer *gud-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for your debugger."
  (interactive
   (list (read-from-minibuffer "Run rubydb (like this): "
                               (if (consp gud-rubydb-history)
                                   (car gud-rubydb-history)
                                 (concat rubydb-command-name " "))
                               nil nil
                               '(gud-rubydb-history . 1))))

  (if (not (fboundp 'gud-overload-functions))
      (gud-common-init command-line 'gud-rubydb-massage-args
                       'gud-rubydb-marker-filter 'gud-rubydb-find-file)
    (gud-overload-functions '((gud-massage-args . gud-rubydb-massage-args)
                              (gud-marker-filter . gud-rubydb-marker-filter)
                              (gud-find-file . gud-rubydb-find-file)))
    (gud-common-init command-line rubydb-command-name))

  (gud-def gud-break  "b %l"         "\C-b" "Set breakpoint at current line.")
                                        ;  (gud-def gud-remove "clear %l"     "\C-d" "Remove breakpoint at current line")
  (gud-def gud-step   "s"            "\C-s" "Step one source line with display.")
  (gud-def gud-next   "n"            "\C-n" "Step one line (skip functions).")
  (gud-def gud-cont   "c"            "\C-r" "Continue with display.")
  (gud-def gud-finish "finish"       "\C-f" "Finish executing current function.")
  (gud-def gud-up     "up %p"        "<" "Up N stack frames (numeric arg).")
  (gud-def gud-down   "down %p"      ">" "Down N stack frames (numeric arg).")
  (gud-def gud-print  "p %e"         "\C-p" "Evaluate ruby expression at point.")

  (setq comint-prompt-regexp "^(rdb:-) ")
  (if (boundp 'comint-last-output-start)
      (set-marker comint-last-output-start (point)))
  (set (make-local-variable 'paragraph-start) comint-prompt-regexp)
  (run-hooks 'rubydb-mode-hook)
  )
