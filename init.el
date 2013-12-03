;;; init -- my emacs configuration
(require 'cl)
;;(setq debug-on-error t)
(setq dotfiles-dir "~/.emacs.d")
(setq init-files-dir (concat dotfiles-dir "/init-files"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path init-files-dir)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'basic-settings)

(add-to-list 'custom-theme-load-path
             (concat dotfiles-dir "/themes/"))

;;(load-theme 'occidental) ;;-- great light theme
;;(load-theme 'leuven)
;;(load-theme 'flatland)
;;(load-theme 'colorsarenice-dark)
(require 'color-theme-sanityinc-tomorrow)

;;(color-theme-sanityinc-tomorrow-day)
;;(color-theme-sanityinc-tomorrow-night)
(color-theme-sanityinc-tomorrow-blue)
;;(load-theme 'tronesque) ;; -- night
;;(color-theme-sanityinc-tomorrow-bright)
;;(color-theme-sanityinc-tomorrow-eighties)



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
(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)
(require 'init-file-associations)
;;(require 'init-evil)

;; go fullscreen
(set-frame-parameter nil 'fullscreen
                     (if (frame-parameter nil 'fullscreen)
                         nil
                       'fullboth))
(use-package rbenv
  :init (global-rbenv-mode))
