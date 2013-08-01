(require 'cl)

(setq dotfiles-dir "~/.emacs.d")
(setq init-files-dir (concat dotfiles-dir "/init-files"))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path init-files-dir)

(require 'basic-settings)
(require 'startup) ;; Load packages

(load-theme 'dorsey t)

(require 'custom-modeline)

(load "im-abbrev")

(require 'helpers)
(require 'keys)
(require 'gist)

(setq locate-command "mdfind")

;;;; Customize some packages
(require 'init-clojure-mode)
(require 'init-completition)
(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)
(require 'init-projectile)
(require 'init-recentf)
(require 'init-ruby-mode)
(require 'init-shell-mode)
;;(require 'make-mark-visible)

;;;; smex
(after 'smex-autoloads
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(load "server")
(unless (server-running-p) (server-start))
