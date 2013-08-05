(autoload 'inf-ruby-mode-hook "inf-ruby" t)
(autoload 'haml-mode "haml-mode" t)
(autoload 'ruby-end-mode "ruby-end" t)
(autoload 'rspec-mode "rspec-mode" t)
(autoload 'web-mode "web-mode" t)

(require 'ruby-mode)
;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq yas/mode-symbol 'ruby-mode)
(setq yas/mode-symbol 'rails-mode)
(require 'ruby-mode-indent-fix)
(setq ruby-use-encoding-map nil)

(require 'ruby-test-mode)
(setq ruby-test-ruby-executables '("/Users/ignacymoryc/.rvm/rubies/ruby-1.9.3-p125/bin/ruby"))
(ruby-test-mode)

(add-hook 'ruby-mode-hook
          (lambda ()
            (ruby-electric-mode)
            (inf-ruby-minor-mode)
            (ruby-end-mode)))

(define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)

(defun rails-console ()
  "Runs inf-ruby process with a rails console loaded inside"
  (interactive)
  (run-ruby "rails console"))

(defun rails-server ()
  "Runs rails server for the current project"
  (interactive)
  (ruby-compilation-run "rails server" nil "server"))

(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq tab-width 2)
(setq rspec-use-rake-when-possible nil)
(setq rspec-use-rvm t)
(setq rspec-use-bundler-when-possible t)

(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

(provide 'init-ruby-mode)
