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

;;(load-theme 'underwater t)
;;(load-theme 'grandshell2 t)
;;(load-theme 'lush t)

(load-theme 'zenburn t)


(defun fix-fonts (type)
  " wiegth: 'normal or 'light"
  (interactive)
  (mapc (lambda (face)
          (set-face-attribute face nil :weight type :underline nil))
        (face-list)))

;;(fix-fonts 'light)

(set-frame-font "Source Code Pro 15")
