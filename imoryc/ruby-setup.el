;; Setup ruby

;; (add-to-list 'load-path (concat dotfiles-dir "/ruby-debug-extra-0.10.1"))
;; (add-to-list 'load-path (concat dotfiles-dir "/ruby-debug-extra-0.10.1/emacs"))
;; (require 'rdebug)


(add-to-list 'load-path (concat dotfiles-dir "/rhtml"))
(require 'rhtml-mode)


(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

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

(eval-after-load 'ruby-mode
  '(progn
     (ignore-errors (require 'ruby-compilation))
     (ignore-errors (require 'inf-ruby))
     (setq ruby-use-encoding-map nil)
     (setq ruby-deep-arglist t)
     (setq ruby-deep-indent-paren nil)
     (setq ruby-insert-encoding-magic-comment nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     ;;(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
     (setq tab-width 2)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(defadvice find-tag (before c-tag-file activate)
  "Automatically create tags file."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command "ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor 2>/dev/null"))
    (visit-tags-table tag-file)))

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

;; (add-to-list 'load-path (concat dotfiles-dir "/Enhanced-Ruby-Mode")) ; must be added after any path containing old ruby-mode
;; (setq enh-ruby-program "/home/ignacy/.rvm/rubies/ruby-1.9.2-p290/bin/ruby") ; so that still works if ruby points to ruby1.8
;; (load-file (concat dotfiles-dir "/Enhanced-Ruby-Mode/ruby-mode.el"))


(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))

;;;###autoload
