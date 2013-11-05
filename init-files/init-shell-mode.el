(defun im/shell-mode-hook ()
  (setq show-trailing-whitespace nil)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil)
  (ansi-color-for-comint-mode-on)
  (message "Running im/shell mode hook")
  (hl-line-mode nil))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 'im/shell-mode-hook)
(setq explicit-shell-file-name "/bin/zsh")

;; make a face
(make-face 'font-lock-small-face)
(set-face-attribute 'font-lock-small-face nil :height 0.9)

;; add this setting to all shell-mode buffers
(add-hook 'shell-mode-hook
       '(lambda ()
          (font-lock-mode t)
          (buffer-face-mode t) ; only in emacs 23
          (buffer-face-set 'font-lock-small-face)))

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun zsh ()
  (interactive)
  (shell "zsh"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))

(provide 'init-shell-mode)
