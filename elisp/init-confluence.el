(use-package confluence
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.confluence$" . confluence-mode))))


(provide 'init-confluence)
