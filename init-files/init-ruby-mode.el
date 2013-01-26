(require 'inf-ruby)
(require 'haml-mode)
(require 'ruby-end)
(require 'flymake-ruby)
(require 'rspec-mode)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))


(eval-after-load 'ruby-mode
    '(progn
       ;; work around possible elpa bug
       (ignore-errors (require 'ruby-compilation))
       (setq ruby-use-encoding-map nil)
       (add-hook 'ruby-mode-hook 'flymake-ruby-load)
       (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
       (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)))


(defun rails-root (&optional dir)
  (or dir (setq dir default-directory))
  (if (file-exists-p (concat dir "config/environment.rb"))
      dir
    (unless (equal dir "/")
      (rails-root (expand-file-name (concat dir "../"))))))

(defun rails-console ()
  (interactive)
  (run-ruby (concat (rails-root) "script/rails c")))

(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist t)
(setq ruby-deep-indent-paren t)
(setq ruby-insert-encoding-magic-comment nil)
(setq tab-width 2)

(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))


(setq rspec-use-rake-flag nil)
(setq rspec-use-rvm nil)
(setq rspec-use-bundler-when-possible nil)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

(provide 'init-ruby-mode)
