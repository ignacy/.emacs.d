(add-hook 'after-init-hook 'global-company-mode)


(defalias 'yas/current-snippet-table 'yas--get-snippet-tables)
(yas-global-mode 1)


(provide 'init-completition)
