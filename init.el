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

;;(load-theme 'ir-black)
;;(load-theme 'tsdh-dark)
(load-theme 'colorsarenice-dark)

(require 'ag)
(setq ag-highlight-search nil)

(require 'custom-modeline)

(require 'helpers)
(require 'keys)
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

;;;; smex
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; go fullscreen
(set-frame-parameter nil 'fullscreen
                     (if (frame-parameter nil 'fullscreen)
                         nil
                       'fullboth))

(require 'chruby)
(chruby "jruby-1.7.4")

;; (load "server")
;; (unless (server-running-p) (server-start))
