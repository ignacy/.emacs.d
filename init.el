;;; init -- my emacs configuration
(require 'cl)
(setq debug-on-error nil)

;;(setq default-frame-alist '((font . "Menelo-14")))
;;(setq default-frame-alist '((font . "Source Code Pro-14")))
(setq default-frame-alist '((font . "Cousine-14")))


;;(set-frame-font "Cousine 14")
;;(set-frame-font "Menelo 13")
;;(set-frame-font "Inconsolata 16")
;;(set-frame-font "Source Code Pro 14")

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)

(require 'basic-settings)

(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))
;;(load-theme 'dream t)
;;(load-theme 'easyballs t)
;;(load-theme 'mbo t)
;;(load-theme 'atom-dark t)
;;(load-theme 'oscuro t)
(load-theme 'tech49 t)

(autoload 'gofmt-before-save "go-mode"
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook 'go-mode-hook (lambda () (setq tab-width 4)))

(use-package smart-modeline)
(use-package helpers)
(use-package keys)

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

;; (use-package color-identifiers-mode
;;   :init
;;   (global-color-identifiers-mode t))

(fringe-mode '(0 . 0))

(set-cursor-color "#ff000")


(require 'server)
(if (server-running-p)
    (message "Server already running")
  (message "Starting server")
  (server-start))
