;;; init -- my emacs configuration
(require 'cl)
(setq debug-on-error nil)

;;(set-frame-font "OpenDyslexicMono 14")
;;(set-frame-font "Monaco 12")
;;(set-frame-font "Menelo 13")
;;(set-frame-font "Inconsolata 16")
(set-frame-font "Inconsolata-g 14")
;;(set-frame-font "Source Code Pro 12")

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)

(require 'basic-settings)
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))
(load-theme 'tango-plus t)
;;(load-theme 'badger t)
;;(load-theme 'tango-dark t)

(use-package color-identifiers-mode
  :init (global-color-identifiers-mode t))

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
(require 'ido-bookmark-jump)

(require 'init-org)
;;(require 'init-evil)

(use-package rbenv :init (global-rbenv-mode))

(fringe-mode '(0 . 0))


(autoload 'typing-test "typing-test" nil t)

(require 'server)
(if (server-running-p)
    (message "Server already running")
  (message "Starting server")
  (server-start))
(put 'dired-find-alternate-file 'disabled nil)
