(require 'cl)


(defvar on-windows (eq system-type 'windows-nt))

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/mark-multiple"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/ace-jump-mode"))

(require 'init-packages)


;; rbenv
(setq exec-path (cons "~/.rbenv/bin" exec-path))
(setenv "PATH" (concat "~/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons "~/.rbenv/shims" exec-path))
(setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;(set-face-attribute 'default nil :font "inconsolata-16")



(require 's) ;; for String manipulation


(load-file "~/code/ebot/ebot.el")
(ebot-command "run-spec" (lambda () (concat "bex rspec " (ebot-file-name-and-position))))
(ebot-command "heroku-staging-backend" "heroku run console --app newsit-backend-staging")
(ebot-command "cdtmm" "cd ~/code/eleos/newsit-mm")
(ebot-command "cdtmmserv" "cd ~/code/eleos/newsit-mm" "server")

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook           (lambda () (paredit-mode +1)))


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
(require 'repository-root)
(require 'init-javascript-settings)
(require 'wgrep)
(require 'init-projectile)
(require 'grep-o-matic)
(require 'ido)
(ido-mode 'both)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)


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
;; Subtler highlight
(set-face-background 'magit-item-highlight "#121212")
(set-face-foreground 'diff-context "#666666")
(set-face-foreground 'diff-added "#00cc33")
(set-face-foreground 'diff-removed "#ff0000")


(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

(setq rsense-home "~/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(require 'mustache-mode)

;;(require 'multiple-cursors)
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
;;(require 'init-mu4e)
(require 'gist)

(winner-mode 1)
(windmove-default-keybindings)
(require 'init-eshell)
(require 'init-shell-mode)
(require 'init-buffer-switching)
(require 'init-clojure-mode)
(require 'init-completition)
(require 'im-basic-settings)
(require 'slime)
(slime-setup)
