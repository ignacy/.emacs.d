;;; init -- my emacs configuration
(require 'cl)
(setq debug-on-error t)

;;(set-frame-font "OpenDyslexicMono 14")
;;(set-frame-font "Monaco 13")
;;(set-frame-font "Menelo 12")
(set-frame-font "Inconsolata 16")
;;(set-frame-font "Inconsolata-g 13")
;;(set-frame-font "Source Code Pro 15")

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)

(require 'basic-settings)
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))
(load-theme 'ujelly t)

(use-package smart-modeline)
(use-package helpers)
(use-package keys)

;;;; Customize some packages
(require 'init-file-associations)
(require 'init-clojure-mode)
;;(require 'init-scala)
(require 'init-completition)
(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)
(require 'init-projectile)
(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)

(require 'init-org)
;;(require 'init-evil)

(use-package rbenv :init (global-rbenv-mode))
