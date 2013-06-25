(require 'cl)

(setq dotfiles-dir "~/.emacs.d")
(setq init-files-dir (concat dotfiles-dir "/init-files"))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path init-files-dir)

(require 'basic-settings)
(require 'startup) ;; Load packages

;;(load-theme 'sea-before-storm t)
(load-theme 'subatomic t)
(require 'custom-modeline)

(require 'helpers)
(require 'keys)
(require 'gist)

;;;; Customize some packages
(require 'init-clojure-mode)
(require 'init-completition)
(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)
(require 'init-projectile)
(require 'init-recentf)
(require 'init-ruby-mode)
(require 'init-shell-mode)
