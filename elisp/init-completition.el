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
