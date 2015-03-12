;; setting for flymake

(use-package flycheck
  :ensure flycheck
  :init (progn
          (setq flycheck-ruby-rubocop-executable "~/.rbenv/versions/2.2.1/bin/rubocop") ))


(provide 'init-flycheck)
;;; init-flycheck.el ends here
