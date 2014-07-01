;;; init -- my emacs configuration
(require 'cl)
(setq debug-on-error nil)

;;(set-frame-font "Monaco 12")
;;(set-frame-font "Menelo 13")
;;(set-frame-font "Inconsolata 16")
;;(set-frame-font "Inconsolata-g 12")
;;(set-frame-font "Source Code Pro 12")

(setq dotfiles-dir "~/.emacs.d")
(setq configuration-files-dir (concat dotfiles-dir "/elisp"))
(add-to-list 'load-path configuration-files-dir)
(setq custom-file (expand-file-name "custom.el" configuration-files-dir))
(load custom-file)

(require 'basic-settings)

;; (setq elscreen-tab-display-control nil)
;; (setq elscreen-tab-display-kill-screen nil)
;; (elscreen-start)


(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/themes/"))
;;(load-theme 'ir-black t)
;(load-theme 'tango-dark t)
(load-theme 'tech49 t)
;;(load-theme 'resesif-boned t)

;; (global-hl-line-mode)
;; (set-face-attribute hl-line-face nil :underline nil)
;; (set-face-background hl-line-face "ivory4")

(use-package color-identifiers-mode
  :init
  (global-color-identifiers-mode t))

(use-package smart-modeline)
(use-package helpers)
(use-package keys)

;;;; Customize some packages
(require 'init-file-associations)
(require 'init-clojure-mode)
;;(require 'init-scala)
(require 'init-completition)
;;(require 'init-javascript-settings)
(require 'init-markup-and-style-modes)
(require 'init-projectile)
(require 'init-magit)
(require 'init-ruby-mode)
(require 'init-shell-mode)
(require 'ido-bookmark-jump)
(require 'init-org)
;;(require 'init-evil)

(use-package rbenv
  :init (progn
          (setq rbenv-show-active-ruby-in-modeline nil)
          (global-rbenv-mode)))

(fringe-mode '(0 . 0))

(autoload 'typing-test "typing-test" nil t)

(require 'server)
(if (server-running-p)
    (message "Server already running")
  (message "Starting server")
  (server-start))

(use-package auto-dim-other-buffers
  :init (auto-dim-other-buffers-mode t))


(use-package simp
  :init (progn
          (simp-project-define
           '(:has (.git)
                  :ignore (.git)))
          (simp-project-define
           '(:type rails
                   :has (config.ru app/views app/models app/controllers)
                   :ignore (tmp coverage log vendor .git public/system public/assets)))))

(setq simp-completing-read-command 'ido-completing-read)
(global-set-key (kbd "C-c f") 'simp-project-find-file)
(global-set-key (kbd "C-x f") 'simp-project-find-file)
(global-set-key (kbd "C-c d") 'simp-project-root-dired)
(global-set-key (kbd "C-c s") 'simp-project-rgrep)
(global-set-key (kbd "C-c S") 'simp-project-rgrep-dwim)
(global-set-key (kbd "C-c b") 'simp-project-ibuffer-files-only)
(global-set-key (kbd "C-c B") 'simp-project-ibuffer)
(global-set-key (kbd "C-c C-f") 'simp-project-with-bookmark-find-file)
(global-set-key (kbd "C-c C-s") 'simp-project-with-bookmark-rgrep)
(global-set-key (kbd "C-c C-b") 'simp-project-with-bookmark-ibuffer)




(display-time-mode -1)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
