(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; (add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-highlight-level 3)
(provide 'init-javascript-settings)
