(require 'cl)
;;(setq debug-on-error t)
(defvar set-java-paths-on-windows t)
(defvar set-working-on-bdj t)
(defvar set-indent-before-saving t)
(defvar on-windows (eq system-type 'windows-nt))

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/mark-multiple"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/ace-jump-mode"))

(require 'init-packages)
(require 'im-basic-settings)
(ignore-errors
  (require 'color-theme-sanityinc-tomorrow)
  (color-theme-sanityinc-tomorrow-night))
;;(load-file (concat imoryc-dir "/themes/color-theme-molokai.el"))
;;(load-file (concat imoryc-dir "/themes/afterthought-theme.el")))
;;  (color-theme-molokai))

(require 'init-yasnippet)
;; (require 'autopair)
;; (autopair-global-mode)

(require 'find-file-in-tags)
(global-set-key (read-kbd-macro "C-,") 'find-file-in-tags)

(require 'ido)
(ido-mode 'both)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'init-markup-and-style-modes)
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
;; (load-file (concat imoryc-dir "/java-setup.el"))

(require 'epa)
(epa-file-enable)

(require 'textmate)
(textmate-mode)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(require 'uniquify)

(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator "@")

(load-file (concat imoryc-dir "/project-top.el"))
(load-file (concat imoryc-dir "/compile-mode-options.el"))
(load-file (concat imoryc-dir "/window-manage.el"))
(load-file (concat imoryc-dir "/testowanie.el"))
;;(require 'matlab)

(require 'magit)
(require 'android-mode)

(setq rsense-home "~/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this)
(global-set-key (kbd "C-*") 'mark-all-like-this)
(require 'init-autocomplete)
(require 'init-org-mode)
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'init-ruby-mode)

(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(require 'init-recentf)
(load-file (concat imoryc-dir "/im-helpers.el"))
(load-file (concat imoryc-dir "/im-keys.el"))
(load-file (concat imoryc-dir "/im-abbrevs.el"))

(require 'init-shell-mode)
(require 'init-buffer-switching)
(require 'init-clojure-mode)

(ns-toggle-fullscreen)
