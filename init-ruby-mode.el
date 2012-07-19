(require 'rvm)
(rvm-use "ruby-1.9.3" "jobandtalent")

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


(provide 'init-ruby-mode)
