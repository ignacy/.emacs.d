(use-package yasnippet
  :init
  (progn
    (defalias 'yas/current-snippet-table 'yas--get-snippet-tables)
    (yas-global-mode 1)))

(defun company-yasnippet-or-completion ()
  (interactive)
  (if (yas/expansion-at-point)
      (progn (company-abort)
             (yas/expand))
    (company-complete-common)))

(defun yas/expansion-at-point ()
  "Tested with v0.6.1. Extracted from `yas/expand-1'"
  (first (yas/current-key)))

(use-package company
  :init
  (progn
    ;;(setq company-idle-delay t)
    (push 'company-readline company-backends)
    (push 'company-robe company-backends)
    (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))
    (define-key company-active-map "\t" 'company-yasnippet-or-completion)
    (global-company-mode)
    (add-to-list 'company-dabbrev-code-modes 'prog-mode)
    (add-to-list 'company-dabbrev-code-modes 'ruby-mode)))

(add-hook 'after-init-hook 'global-company-mode)

;;(global-set-key (kbd "C-c y") 'company-yasnippet)

(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt yas-x-prompt yas-dropdown-prompt))

(require 'setup-hippie)


(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)

(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(provide 'init-completition)
