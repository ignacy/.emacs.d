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

(set-language-environment "UTF-8")
(setenv "LC_LOCALE" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

;;(load-theme 'ir-black)
;;(load-theme 'tommyh)
(load-theme 'noctilux)

(require 'ag)
(setq ag-highlight-search nil)


(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

;; NOTE: I thought this might be a good idea (having a horizontal line
;; pointig at the cursor but it's getting to distracting
;;(require 'crosshairs)
;;(setq col-highlight-vline-face-flag t)
;;(crosshairs-mode 1)
;;(set-face-background 'col-highlight "#ddd")

(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline nil)

;;(set-face-background 'hl-line "#222")
;;(set-face-background 'hl-line "#ddd")

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


(require 'rvm)
(rvm-use-default)


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
