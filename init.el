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
(load-theme 'flatland)

(require 'ag)
(setq ag-highlight-search nil)

(require 'smart-modeline)

(require 'helpers)
(require 'keys)
;;(require 'setup-evil)
(require 'gist)

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
(require 'rbenv)
(global-rbenv-mode)
