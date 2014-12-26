(use-package inf-ruby)
(use-package ruby-mode)
(use-package rspec-mode)
(use-package rhtml-mode
  :init
  (progn

    (defun customizations-for-rhtml-mode ()
      (interactive)
      (setq tab-width 2)
      (setq highlight-indentation-offset 2)
      (highlight-indentation-mode))

    (add-hook 'rhtml-mode-hook 'customizations-for-rhtml-mode)))



;; work around possible elpa bug
(ignore-errors (require 'ruby-compilation))
(setq yas/mode-symbol 'ruby-mode)
(setq yas/mode-symbol 'rails-mode)
(setq ruby-use-encoding-map nil)

(add-hook 'after-init-hook 'inf-ruby-switch-setup)


(use-package ruby-mode
  :init (progn
          ;; Libraries
          (require 'flymake)
          ;; Invoke ruby with '-c' to get syntax checking
          (defun flymake-ruby-init ()
            (let* ((temp-file (flymake-init-create-temp-buffer-copy
                               'flymake-create-temp-inplace))
                   (local-file (file-relative-name
                                temp-file
                                (file-name-directory buffer-file-name))))
              (list "~/.rbenv/versions/2.1.2/bin/ruby" (list "-c" local-file))))

          (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
          (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

          (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
                flymake-err-line-patterns)

          ;;(add-hook 'ruby-mode-hook 'cabbage-flymake-init)

          (add-hook 'ruby-mode-hook
                    (lambda ()
                      (subword-mode 1)
                      (when (and buffer-file-name
                                 (file-writable-p
                                  (file-name-directory buffer-file-name))
                                 (file-writable-p buffer-file-name)
                                 (if (fboundp 'tramp-list-remote-buffers)
                                     (not (subsetp
                                           (list (current-buffer))
                                           (tramp-list-remote-buffers)))
                                   t))
                        (local-set-key (kbd "C-c d") 'flymake-popup-current-error-menu)
                        (flymake-mode t))))))

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (concat "ruby -Ilib:test:. " buffer-file-name))))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)

(use-package robe
  :init (progn
          (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
            (rbenv-use-corresponding))
          (setq robe-turn-on-eldoc nil)
          (add-hook 'ruby-mode-hook 'robe-mode)))


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
