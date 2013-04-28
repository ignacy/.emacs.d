(require 'cl)

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


(electric-indent-mode +1)
(setq default-frame-alist
      '((width . 120)
        (height . 50)
        (menu-bar-lines . 1)
        (vertical-scroll-bar . -1)))


;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'im-set-colors)

(electric-pair-mode +1)
(electric-indent-mode +1)

(require 'helpers)
(require 'keys)
(require 'gist)
(require 'basic-settings)

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'init-buffer-switching)
(require 'init-clojure-mode)
(require 'init-yasnippet)
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
(require 'init-whitespace-mode)
(require 'quickrun)

(setq load-path (cons  "/usr/local/Cellar/erlang/R15B03-1/lib/erlang/lib/tools-2.6.8/emacs/"
      load-path))
      (setq erlang-root-dir "/usr/local/Cellar/erlang")
      (setq exec-path (cons "/usr/local/Cellar/erlang/bin" exec-path))

;; (require 'erlang-start)
;; (defvar inferior-erlang-prompt-timeout t)
(global-git-gutter-mode t)
