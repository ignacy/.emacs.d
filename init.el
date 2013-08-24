(require 'cl)

;;(setq debug-on-error t)

(setq dotfiles-dir "~/.emacs.d")
(setq init-files-dir (concat dotfiles-dir "/init-files"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path init-files-dir)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


(require 'basic-settings)
(require 'startup) ;; Load packages


(if (display-graphic-p)
    (load-theme 'mccarthy)
  (load-theme 'base16-default))

(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline nil)
;;(set-face-background 'hl-line "#333")
(set-face-background 'hl-line "light cyan")

(require 'custom-modeline)

(load "im-abbrev")

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

;; (smartparens-global-mode t)
;; (require 'smartparens-config)
;; (put 'set-goal-column 'disabled nil)
