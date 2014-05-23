(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)


;; make a face
(make-face 'font-lock-small-face)
(set-face-attribute 'font-lock-small-face nil :height 0.9)

(add-hook 'shell-mode-hook
          '(lambda ()
             (setq ansi-color-names-vector ; better contrast colors
                   ["black" "red4" "green4" "yellow4"
                    "blue3" "magenta4" "cyan4" "white"])
             (setq show-trailing-whitespace nil)
             (make-local-variable 'global-hl-line-mode)
             (setq global-hl-line-mode nil)
             (toggle-truncate-lines 1)
             (ansi-color-for-comint-mode-on)
             (set-face-foreground 'highlight nil)
             (font-lock-mode t)
             ;;(buffer-face-mode t) ; only in emacs 23
             ;;(buffer-face-set 'font-lock-small-face)
             (hl-line-mode nil)))

(setq comint-prompt-read-only t)

(setq explicit-shell-file-name "/bin/zsh")


(setq ansi-color-names-vector ; better contrast colors
                  ["black" "red4" "green4" "yellow4"
                   "blue3" "magenta4" "cyan4" "white"])
(ansi-color-for-comint-mode-on)

(add-hook 'term-mode-hook
          (lambda ()
            (setq ansi-color-names-vector ; better contrast colors
                  ["black" "red4" "green4" "yellow4"
                   "blue3" "magenta4" "cyan4" "white"])
            (ansi-color-for-comint-mode-on)
            (setq show-trailing-whitespace nil)
            (make-local-variable 'global-hl-line-mode)
            (setq global-hl-line-mode nil)
            (hl-line-mode nil)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun run-shell (shell-buffer-name)
  "Runs shell in a buffer named shell-buffer-name"
  (interactive "sEnter new shell buffer name: ")
  (shell shell-buffer-name))

(defun zsh ()
  (interactive)
  (shell "zsh"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))


(provide 'init-shell-mode)
