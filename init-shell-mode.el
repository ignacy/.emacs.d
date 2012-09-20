(require 'ansi-color)

(defun im/shell-mode-hook ()
  (setq show-trailing-whitespace nil)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil)
  (ansi-color-for-comint-mode-on)
  (message "Running im/shell mode hook")
  (hl-line-mode nil))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'im/shell-mode-hook)

(setq explicit-shell-file-name "/bin/bash")

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun zsh ()
  (interactive)
  (shell "bash"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "bash"))

(provide 'init-shell-mode)
