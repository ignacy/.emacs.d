;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;; Commentary: init -- my emacs configuration

(require 'cl)
(setq debug-on-error nil)
(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))
(require 'basic-settings)


(load-theme 'farmhouse-dark t)
;;(load-theme 'im t)

;; ;; cursor
;; (setq cursor-in-non-selected-windows nil)
(blink-cursor-mode t)
(setq blink-cursor-blinks 0)
(set-cursor-color "chartreuse2")
;;(setq-default cursor-type '(bar . 5))


;; red line after 80 characters
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;; (setq fci-rule-column 80)
;; (setq fci-rule-color "red")

(use-package helpers)
(use-package keys)

;;;; Customize some packages
(require 'init-file-associations)
;;(require 'init-clojure-mode)
(require 'init-completition)
(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)

(require 'init-projectile)

(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-go-mode)
(require 'init-shell-mode)
(require 'ido-bookmark-jump)
(require 'init-org)

(require 'init-flycheck)
(require 'init-compilation)
;;(require 'init-evil)

(use-package smart-modeline)


(use-package rbenv
  :ensure rbenv
  :init (progn
          ;;(setq rbenv-installation-dir "/usr/local/rbenv")
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))

;;(set-frame-font "Office Code Pro 15")
(set-frame-font "Source Code Pro 15")
;;(set-frame-font "Inconsolata-g 15")
;;(set-frame-font "Lucida Grande Mono 14")

(mapc
  (lambda (face)
    (set-face-attribute face nil :weight 'normal :underline nil))
  (face-list))

(recentf-cleanup) ;; remove old files from recentf list
