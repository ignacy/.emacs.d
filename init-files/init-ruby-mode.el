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
(add-hook 'ruby-mode-hook 'robe-mode)
(push 'ac-source-robe ac-sources)

;; (require 'ruby-test-mode)
;; (setq ruby-test-ruby-executables '("/Users/ignacymoryc/.rvm/rubies/ruby-1.9.3-p125/bin/ruby"))
;; (ruby-test-mode)


(add-hook 'ruby-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "ruby -Ilib:test:. " buffer-file-name))))


(set-face-attribute (make-face 'test-heading1) nil
                    :family "arial"
                    :height 240
                    :background "#000000"
                    :foreground "#9999ff"
                    :weight 'bold)

(set-face-attribute (make-face 'test-heading2) nil
                    :family "arial"
                    :height 180
                    :background "#000000"
                    :foreground "#9999ff"
                    :weight 'bold)

(set-face-attribute (make-face 'test-success) nil
                    :family "arial"
                    :height 240
                    :foreground (if window-system "#00aa00" "white")
                    :weight 'bold)

(set-face-attribute (make-face 'test-failure) nil
                    :family "arial"
                    :height 240
                    :foreground (if window-system "ff3333" "white")
                    :weight 'bold)

(add-to-list 'compilation-mode-font-lock-keywords
             '("^\\([0-9]+ examples?, 0 failures?.*\n\\)"
               (1 'test-success)))

(add-to-list 'compilation-mode-font-lock-keywords
             '("^\\(.* 0 failures, 0 errors.*\n\\)"
               (1 'test-success)))

(add-to-list 'compilation-mode-font-lock-keywords
             '("\\(\\.\\)" (1 'test-success)))

(add-to-list 'compilation-mode-font-lock-keywords
             '("^\\(.* [1-9][0-9]* \\(failures?\\|errors?\\).*\n\\)"
               (1 'test-failure)))

(add-to-list 'compilation-mode-font-lock-keywords
             '("^= \\(.*\n\\)"
               (1 'test-heading1)))

(add-to-list 'compilation-mode-font-lock-keywords
             '("^==+ \\(.*\n\\)"
               (1 'test-heading2)))


;; (defun jw-test-remove-stupid-messages ()
;;   (save-excursion
;;     (goto-char (max (- (point) 10) (point-min)))
;;     (while (re-search-forward "\\(WARNING\\|CONTEXT\\|NOTICE\\):.*
;; " nil t)
;;       (replace-match "_"))))


;; (defun jw-test-compilation-buffer-hook-function ()
;;   "Remove carriage returns that occasionally pollute the compile buffer."
;;   (save-current-buffer
;;     (set-buffer (get-buffer "*compilation*"))
;;     (let ((buffer-read-only nil))
;;       (jw-test-remove-stupid-messages))))

;; (add-hook 'compilation-filter-hook 'jw-test-compilation-buffer-hook-function)


(define-key ruby-mode-map (kbd "C-c C-,") 'compile)

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

;; (defadvice rspec-compile (around rspec-compile-around)
;;   "Use BASH shell for running the specs because of ZSH issues."
;;   (let ((shell-file-name "/bin/bash"))
;;     ad-do-it))
;; (ad-activate 'rspec-compile)

(setq explicit-shell-file-name "/bin/zsh")

(provide 'init-ruby-mode)
