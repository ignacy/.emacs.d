(require 'cl)

(setq debug-on-error t)

(setq dotfiles-dir "~/.emacs.d")
(setq init-files-dir (concat dotfiles-dir "/init-files"))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path init-files-dir)

(require 'basic-settings)
(require 'startup) ;; Load packages

(load-theme 'spolsky t)

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
(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)
(require 'init-file-associations)


(require 'rvm)
(rvm-use-default)

;;;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
