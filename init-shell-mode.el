(require 'ansi-color)

(defun im/shell-mode-hook ()
  (setq show-trailing-whitespace nil)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil)
  (message "Running im/shell mode hook")
  (hl-line-mode nil))

(add-hook 'shell-mode-hook 'im/shell-mode-hook)
(add-hook 'term-mode-hook 'im/shell-mode-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun zsh ()
  (interactive)
  (shell "zsh"))

(defun spork ()
  (interactive)
  (shell "spork"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))

(load-file (concat imoryc-dir "/shell-parse.el"))

(defadvice shell-command (around shell-command-unique-buffer activate compile)
  (if (or current-prefix-arg
          (not (string-match "[ \t]*&[ \t]*\\'" command)) ;; background
          (bufferp output-buffer)
          (stringp output-buffer))
      ad-do-it ;; no behavior change

    ;; else we need to set up buffer
    (let* ((command-buffer-name
            (format "*background: %s*"
                    (substring command 0 (match-beginning 0))))
           (command-buffer (get-buffer command-buffer-name)))

      (when command-buffer
        ;; if the buffer exists, reuse it, or rename it if it's still in use
        (cond ((get-buffer-process command-buffer)
               (set-buffer command-buffer)
               (rename-uniquely))
              ('t
               (kill-buffer command-buffer))))
      (setq output-buffer command-buffer-name)

      ;; insert command at top of buffer
      (switch-to-buffer-other-window output-buffer)
      (insert "Running command: " command
              "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")

      ;; temporarily blow away erase-buffer while doing it, to avoid
      ;; erasing the above
      (ad-activate-regexp "erase-buffer-noop")
      ad-do-it
      (ad-deactivate-regexp "erase-buffer-noop"))))
(provide 'init-shell-mode)
