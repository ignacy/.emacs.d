;;; init -- my emacs configuration
(require 'cl)

;;(setq debug-on-error t)

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)

(require 'basic-settings)


(add-to-list 'custom-theme-load-path
             (concat dotfiles-dir "/themes/"))

(load-theme 'ir-black t)

(use-package ag
  :init (setq ag-highlight-search nil))

(use-package smart-modeline)

(use-package helpers)
(use-package keys)
(use-package gist)

;;;; Customize some packages
(require 'init-clojure-mode)
(require 'init-scala)
(require 'init-completition)
(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)
(require 'init-projectile)
(require 'init-ibuffer)
(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)
(require 'init-file-associations)
(require 'init-org)
(require 'init-confluence)
;;(require 'init-evil)

(use-package rbenv
  :init (global-rbenv-mode))
