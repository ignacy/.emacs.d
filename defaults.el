(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(when (not package-archive-contents) (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(setq im-synched-dir "~/Dropbox/")
(setq use-package-always-ensure t)
(require 'use-package)

(use-package better-defaults)
(global-auto-revert-mode 1)
(setq inhibit-startup-message 't)
(setq tags-add-tables nil)
(setq tags-revert-without-query 1)
(set-default 'truncate-lines t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(delete-selection-mode t)
(setq dotfiles-dir "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq kill-ring-max 200                 ; More killed items
      kill-do-not-save-duplicates t     ; No duplicates in kill ring
      save-interprogram-paste-before-kill t)

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(use-package exec-path-from-shell
  :init (progn
          (setq exec-path-from-shell-arguments '("-l"))
          (exec-path-from-shell-initialize)
          (exec-path-from-shell-copy-env "GOPATH")
          (exec-path-from-shell-copy-env "PATH")))

(use-package company
  :init (progn
          (setq company-dabbrev-downcase nil)
          (setq company-dabbrev-ignore-case nil)
          (global-company-mode t)))

(setq abbrev-file-name (concat dotfiles-dir "abbrevations"))
(setq dabbrev-case-replace nil)
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)
(setq default-abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))


(setq-default mode-line-format
              (list
               '(:eval (propertize "%* " 'face font-lock-warning-face))
               ;; value of current buffer name
               "%b, "
               '(vc-mode vc-mode)
               " (%l %c) "
               ))

(setq-default display-line-numbers 't)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))

(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)
(use-package flx-ido
  :init (progn
          (flx-ido-mode 1)
          (setq ido-use-faces nil)))

(use-package ido-vertical-mode
  :init (progn
          (ido-vertical-mode)
          (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)))

(use-package ido-completing-read+
  :init (ido-ubiquitous-mode 1))

(use-package projectile
  :bind (
         ("C-c C-p" . projectile-switch-project)
         ("C-x f" . projectile-find-file)))

(use-package ruby-mode
  :init (progn
          (add-hook 'ruby-mode-hook
                    (lambda () (ruby-test-mode 1)))
          (add-hook 'ruby-mode-hook
                    (lambda () (subword-mode 1)))))

(setq ruby-use-encoding-map nil)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren '(?\[ ?\] t))
(setq ruby-insert-encoding-magic-comment nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-indent-paren nil)

(use-package rubocop
  :init (define-key ruby-mode-map (kbd "C-c C-f") 'rubocop-autocorrect-current-file))

(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (ignore-errors (global-rbenv-mode))))

(use-package yasnippet
  :init (yas-global-mode 1))

(use-package magit
  :config (progn
            (setq magit-process-popup-time 1)
            (magit-add-section-hook 'magit-status-sections-hook
                                    'magit-insert-unpushed-to-upstream
                                    'magit-insert-unpushed-to-upstream-or-recent
                                    'replace)
            (setq magit-completing-read-function 'ido-completing-read))
  :init (progn
          (defun im/magit-soft-reset-head~1 ()
            "Undo last commit (soft)"
            (interactive)
            (magit-reset-soft "HEAD~1"))

          (global-set-key (kbd "<escape> g") 'magit-status)
          (global-set-key (kbd "C-x g") 'magit-status)))


(defun top-join-line ()
  "Join the current line with the line beneath it."
  (interactive)
  (delete-indentation 1))
(global-set-key (kbd "M-j") 'top-join-line)

(global-set-key (kbd "C-<tab>") (lambda () (interactive) (switch-to-buffer (other-buffer (current-buffer) 1))))
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))

(provide 'defaults)
