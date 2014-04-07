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
    (define-key company-active-map "\t" 'company-yasnippet-or-completion)
    (global-company-mode)))

(add-hook 'after-init-hook 'global-company-mode)

(use-package yasnippet
  :init
  (progn
    (defalias 'yas/current-snippet-table 'yas--get-snippet-tables)
    (yas-global-mode 1)
    (require 'dropdown-list)
    (setq yas-prompt-functions '(yas-dropdown-prompt
                                 yas-ido-prompt
                                 yas-completing-prompt))))

(require 'setup-hippie)

(provide 'init-completition)
