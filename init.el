;;; init -- my emacs configuration
(require 'cl)
(setq debug-on-error nil)

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))

(require 'basic-settings)

(load-theme 'oceanic-eighties t)
;;(load-theme 'warm-night t)
(load-theme 'soft-stone t)

;;(require 'nssh)
;;(set-frame-font "Source Code Pro 15")
(set-frame-font "Monaco 14")
;;(set-frame-font "Inconsolata-g 15")

;; red line after 80 characters
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;; (setq fci-rule-column 80)
;; (setq fci-rule-color "red")


(defun fix-fonts (type)
  " wiegth: 'normal or 'light"
  (interactive)
  (mapc (lambda (face)
          (set-face-attribute face nil :weight type :underline nil))
        (face-list)))
;; (fix-fonts 'normal)

(fringe-mode '(0 . 0))



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
  (progn
    ;; (let ((faces '(font-lock-comment-face font-lock-comment-delimiter-face font-lock-constant-face font-lock-type-face font-lock-function-name-face font-lock-variable-name-face font-lock-keyword-face font-lock-string-face font-lock-builtin-face font-lock-preprocessor-face font-lock-warning-face font-lock-doc-face)))
    ;;   (dolist (face faces)
    ;;     (set-face-attribute face nil :foreground nil :weight 'normal :slant 'normal)))

    ;; (set-face-attribute 'font-lock-comment-delimiter-face nil :slant 'italic)
    ;; (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
    ;; (set-face-attribute 'font-lock-doc-face nil :slant 'italic)
    ;; (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
    ;; (set-face-attribute 'font-lock-builtin-face nil :weight 'bold)
    ;; (set-face-attribute 'font-lock-preprocessor-face nil :weight 'bold)
    (add-hook 'after-init-hook 'global-color-identifiers-mode)))
