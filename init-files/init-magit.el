(require 'ansi-color)

(defun my-magit-make-color-map ()
  "Provide ANSI color map to highlight a diff in Magit mode."
  (let ((ansi-color-faces-vector
         [default default default italic underline
           bold bold-italic my-magit-diff-highlight])
        (ansi-color-names-vector
         (vector "black" (face-attribute 'magit-diff-del :foreground)
                 (face-attribute 'magit-diff-add :foreground)
                 "yellow" "blue" "magenta"
                 (face-attribute 'my-magit-range-info :foreground)
                 "white")))
    (set (make-local-variable 'ansi-color-map)
         (ansi-color-make-color-map))))

(require 'magit)

(add-hook 'magit-mode-hook 'my-magit-make-color-map)
(add-hook 'magit-mode-hook (lambda () (setq truncate-lines nil)))

;;(setq magit-diff-options '("--color"))

(defface my-magit-range-info
  '((t :inherit diff-context))
  "Face to highlight range information for a diff."
  :group 'magit-faces)

(defface my-magit-diff-highlight
  '((t))
  "Face to highlight changes in lines for a diff."
  :group 'magit-faces)

;; Change Magit colors for diff highlighting
(set-face-foreground 'magit-diff-del "red3")
(set-face-foreground 'magit-diff-add "green3")
(set-face-foreground 'my-magit-range-info "cyan3")


;; Add an extra newline to separate commit message from git commentary

(defun magit-commit-mode-init ()
  (when (looking-at "\n")
    (open-line 1)))

(add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; close popup when commiting
(defadvice git-commit-commit (after delete-window activate)
  (delete-window))

(provide 'init-magit)
