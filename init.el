(require 'cl)
;;(setq debug-on-error t)

(setenv "PAGER" "/bin/cat")
(setenv "PATH" (concat (getenv "HOME") "/bin:"
                       "/opt/local/bin:"
                       "/usr/local/bin:"
                       (getenv "PATH")))


(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/opt/local/bin")))


(defvar on-windows (eq system-type 'windows-nt))

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/mark-multiple"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/ace-jump-mode"))

;;(set-face-attribute 'default nil :family "Mench" :height 125)

(require 'init-packages)
(ignore-errors
  ;; (require 'color-theme-sanityinc-tomorrow)
  ;; (color-theme-sanityinc-tomorrow-night))
  (load-file (concat imoryc-dir "/themes/twilight-anti-bright-theme.el"))
  ;;(load-file (concat imoryc-dir "/themes/birds-of-paradise-plus-theme.el"))
  (load-theme twilight-anti-bright-theme t))
;; (load-file (concat imoryc-dir "/themes/darkclean-theme.el")))

(require 'init-yasnippet)
(provide 'init-web-development)
;; (require 'autopair)
;; (autopair-global-mode)

(setq line-spacing -1)

;;(require 'init-gnus)
(require 'init-ack)

(require 'init-zencoding)

(require 'repository-root)
(require 'grep-o-matic)

(require 'refheap)
(global-set-key (kbd "C-c r") 'refheap-paste-region-private)

(global-set-key (kbd "C-=") 'er/expand-region)

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

(require 'init-scala-mode-setup)

(require 'uniquify)

(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator "@")

(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(load-file (concat imoryc-dir "/project-top.el"))
(load-file (concat imoryc-dir "/compile-mode-options.el"))
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
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)

(load-file "~/.emacs.d/elpa/ruby-mode-1.1/ruby-mode.el")
(require 'init-ruby-mode)
(require 'init-recentf)
(require 'im-helpers)
(require 'im-keys)

(require 'init-shell-mode)
(require 'init-buffer-switching)
(require 'init-clojure-mode)
(require 'im-basic-settings)
(require 'init-idle-highlight)

;;(ns-toggle-fullscreen)

(sh "server")
(zsh)

;; Diff/git addons
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))
