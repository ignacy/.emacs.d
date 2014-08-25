(use-package inf-ruby)
(use-package ruby-mode)
(use-package rspec-mode)
(use-package ruby-refactor
  :init (add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch))
(use-package rinari :init
  (progn
    (setq rinari-tags-file-name "TAGS")))

(use-package rhtml-mode
  :init
  (progn

    (defun customizations-for-rhtml-mode ()
      (interactive)
      (fci-mode)
      (setq tab-width 2)
      (setq highlight-indentation-offset 2)
      (highlight-indentation-mode))

    (add-hook 'rhtml-mode-hook 'customizations-for-rhtml-mode)))



;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq yas/mode-symbol 'ruby-mode)
(setq yas/mode-symbol 'rails-mode)
(setq ruby-use-encoding-map nil)

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (concat "ruby -Ilib:test:. " buffer-file-name))))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)

;; (require 'ruby-dev)
;; (add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

(defun bundle ()
  "Install bundle"
  (interactive)
  (let ((shell-file-name "/bin/bash"))
    (rbenv-use-corresponding)
    (run-ruby (concat (projectile-project-root) "/bin/bundle install"))))


(defun rails-console ()
  "Runs inf-ruby process with a rails console loaded inside"
  (interactive)
  (let ((shell-file-name "/bin/bash"))
    (run-ruby (concat (projectile-project-root) "/bin/rails console"))))

(defun spork ()
  "Runs inf-ruby process with a rails console loaded inside"
  (interactive)
  (let ((shell-file-name "/bin/bash"))
    (run-ruby "bundle exec spork")))

(defun rails-server ()
  "Runs rails server for the current project"
  (interactive)
  (let ((shell-file-name "/bin/bash"))
    (ruby-compilation-run (concat (simp-project-root) "/bin/rails server") nil "server")))

(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)
(setq tab-width 2)
(setq rspec-use-rake-when-possible nil)
(setq rspec-use-rvm nil)
(setq rspec-use-bundler-when-possible nil)
(setq rspec-command-options "--format documentation --order random")


(font-lock-add-keywords
 'ruby-mode
 '(("\\(\\b\\sw[_a-zA-Z0-9]*:\\)\\(?:\\s-\\|$\\)" (1 font-lock-constant-face))))

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

(setq explicit-shell-file-name "/bin/zsh")


(provide 'init-ruby-mode)
