;;; init -- my emacs configuration
(require 'cl)
(setq debug-on-error nil)

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)

(require 'basic-settings)

(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))

(use-package smart-modeline)
(use-package helpers)
(use-package keys)


(load-file "~/.emacs.local")

;;;; Customize some packages
(require 'init-file-associations)
(require 'init-clojure-mode)
(require 'init-completition)
;;(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)
(require 'init-projectile)
(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)
(require 'ido-bookmark-jump)
(require 'init-org)
(require 'init-neotree)
;;(require 'init-evil)

(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))

(use-package color-identifiers-mode
  :init
  (global-color-identifiers-mode t))

(load-theme 'underwater t)
(set-frame-font "Source Code Pro Light 13")
