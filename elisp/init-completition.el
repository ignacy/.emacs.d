(use-package yasnippet
  :ensure  yasnippet
  :defer t
  :init (yas-global-mode 1)
  :config (progn
            (defalias 'yas/current-snippet-table 'yas--get-snippet-tables)
            (setq yas-verbosity 1)))


(use-package company
  :ensure  company
  :defer t
  :init (progn
          ;;(setq company-idle-delay t)

          (defun company-yasnippet-or-completion ()
            (interactive)
            (if (yas/expansion-at-point)
                (progn (company-abort)
                       (yas/expand))
              (company-complete-common)))

          (defun yas/expansion-at-point ()
            "Tested with v0.6.1. Extracted from `yas/expand-1'"
            (first (yas/current-key)))
          (company-quickhelp-mode 1)
          (push 'company-readline company-backends)
          (push 'company-robe company-backends)
          (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))
          (define-key company-active-map "\t" 'company-yasnippet-or-completion)
          (global-company-mode)
          (add-to-list 'company-dabbrev-code-modes 'prog-mode)
          (add-to-list 'company-dabbrev-code-modes 'ruby-mode)))

;;(global-set-key (kbd "C-c y") 'company-yasnippet)


(require 'setup-hippie)

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq dabbrev-case-replace nil)
(setq default-abbrev-mode t)

(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))

(provide 'init-completition)
