(use-package go-mode)
(use-package go-eldoc)
(use-package golint)
(use-package go-mode-load
  :init (progn
          (defun my-go-mode-hook ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            ;;(if (not (string-match "go" compile-command))
            (subword-mode 1)
            (set (make-local-variable 'compile-command)
                 "go vet && go test -cover -v && go build -v")
            ;;                )

            (setq tab-width 8 indent-tabs-mode 1)
            (local-set-key (kbd "M-.") 'godef-jump))
          (add-hook 'go-mode-hook 'my-go-mode-hook)
          (add-hook 'go-mode-hook 'go-eldoc-setup)))

(provide 'init-go-mode)
