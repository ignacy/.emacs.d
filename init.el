(require 'cl)

(defvar *emacs-load-start* (current-time))

(defvar on-windows (eq system-type 'windows-nt))

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(setq init-files-dir (concat dotfiles-dir "/init-files"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path init-files-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/mark-multiple"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/ace-jump-mode"))

(require 'my-packages)

;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'im-set-colors)

(require 'autopair)
(autopair-global-mode)
(require 'paredit)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(define-key paredit-mode-map (kbd "M-)")
  'paredit-wrap-round-from-behind)

(require 'repository-root)
(require 'stuff-from-esk)
(require 'im-helpers)
(require 'im-keys)
(require 'gist)
(require 'im-basic-settings)
(require 'slime)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'init-ack)
(require 'init-buffer-switching)
(require 'init-clojure-mode)
(require 'init-completition)
(require 'init-eshell)
(require 'init-idle-highlight)
(require 'init-javascript-settings)
(require 'init-magit)
(require 'init-markup-and-style-modes)
(require 'init-org-mode)
(require 'init-projectile)
(require 'init-recentf)
(require 'init-ruby-mode)
(require 'init-scala-mode-setup)
(require 'init-shell-mode)
(require 'init-webjump)
(require 'init-yasnippet)



(add-to-list 'load-path "~/.emacs.d/auto-complete-mode")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-mode/ac-dict")
(ac-config-default)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(setq rsense-home "/Users/imoryc/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)


(require 'change-inner)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

(slime-setup)
