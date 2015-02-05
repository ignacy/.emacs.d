(defvar evil-packages '(evil evil-leader evil-surround evil-nerd-commenter evil-matchit))

(dolist (p evil-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'ido-find-file
  "b" 'ido-switch-buffer
  "f" 'helm-projectile
  "r" 'ido-recentf-open
  "-" 'evil-split-buffer
  "i" 'helm-imenu
  "|" 'split-window-horizontally
  "k" 'im/kill-current-buffer)

(define-key evil-normal-state-map (kbd "SPC") 'evil-ace-jump-char-mode)
(define-key evil-operator-state-map (kbd "SPC") #'evil-ace-jump-char-mode)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-r" 'search-backward)
(define-key evil-visual-state-map "\C-w" 'evil-delete)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil)
(evil-mode 1)


(setq evilnc-hotkey-comment-operator ",,")
(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)


(require 'evil-matchit)
(global-evil-matchit-mode 1)

(provide 'init-evil)
