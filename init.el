(require 'cl)
;;(setq debug-on-error t(set-background-color "honeydew")

(setenv "PAGER" "/bin/cat")
(setenv "PATH" (concat (getenv "HOME") "/bin:"
                       "/opt/local/bin:"
                       "/usr/local/bin:"
                       (getenv "PATH")))

(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/opt/local/bin")))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)
;;(set-face-attribute 'default nil :font "inconsolata-16")

(defvar on-windows (eq system-type 'windows-nt))

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/mark-multiple"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/ace-jump-mode"))

(require 'init-packages)
(require 's) ;; for String manipulation

(add-to-list 'load-path (concat dotfiles-dir "/zossima"))
(add-hook 'inf-ruby-mode-hook 'zossima-mode)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'im-set-colors)
(require 'init-yasnippet)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(require 'autopair)
(autopair-global-mode)

(require 'init-ack)
(require 'init-projectile)
(require 'repository-root)

(require 'wgrep)
(require 'grep-o-matic)
(require 'ido)
(ido-mode 'both)

(require 'init-markup-and-style-modes)

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(require 'epa)
(epa-file-enable)

(require 'textmate)
(textmate-mode)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(require 'init-scala-mode-setup)

(require 'magit)

(setq rsense-home "~/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)


(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)
(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(require 'init-org-mode)
(require 'init-ruby-mode)
(require 'init-recentf)
(require 'im-helpers)
(require 'im-keys)

(require 'init-shell-mode)
(require 'init-buffer-switching)
(require 'init-clojure-mode)
(require 'im-basic-settings)
(require 'slime)
(slime-setup)
(zsh)
