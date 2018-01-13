(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'im-defaults)

(use-package ido-occur
  :bind (("C-c o" . ido-occur)))
(use-package graphql-mode)
(use-package es-mode)
(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)))
(use-package ruby-test-mode)
(use-package flycheck
  ;;:config (setq-default flycheck-disabled-checkers '(ruby-reek))
  :init (global-flycheck-mode t))

(define-key ctl-x-map "\C-i" #'endless/ispell-word-then-abbrev)
(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
sabort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (thing-at-point 'word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word))
      (setq aft (thing-at-point 'word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(use-package dockerfile-mode
  :init (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;; (use-package rspec-mode
;;   :config (progn
;;             (setq rspec-use-rake-when-possible nil)
;;             (setq rspec-use-rvm nil)
;;             (setq rspec-use-bundler-when-possible 't)
;;             (add-hook 'ruby-mode-hook 'rspec-verifiable-mode)))

(use-package smart-jump
  :ensure t
  :bind (("C-M-." . 'smart-jump-go))
  :config
  (smart-jump-setup-default-registers))

(use-package coffee-mode
  :config (custom-set-variables '(coffee-tab-width 2))
  :init (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode)))

(use-package json-mode)
(use-package js2-mode
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
          (setq-default js2-basic-offset 4)
          (setq-default js-indent-level 4)))

(use-package haml-mode)
(use-package slim-mode)

;; (use-package go-mode
;;   :config (progn
;;             (add-hook 'go-mode-hook '(lambda ()
;;                                        (setq gofmt-command "goimports")
;;                                        (local-set-key (kbd "C-c C-f") 'gofmt)
;;                                        (local-set-key (kbd "C-c C-k") 'godoc)
;;                                        (setq tab-width 4)
;;                                        (setq indent-tabs-mode 1)))
;;             (add-hook 'before-save-hook 'gofmt-before-save)))

(use-package ag
  :bind (("C-c r" . ag-files)
         ("M-r" . ag-project-regexp)))

(global-set-key (kbd "M-c") 'query-replace-regexp)

(use-package anzu
  :init (progn (global-anzu-mode +1)
               (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)))

(use-package keyfreq
  :init (progn (keyfreq-mode 1)
               (keyfreq-autosave-mode 1)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(use-package symbol-overlay
  :init (progn
          (add-hook 'prog-mode-hook 'symbol-overlay-mode)
          (global-set-key (kbd "M-i") 'symbol-overlay-put)
          (global-set-key (kbd "M-o") 'symbol-overlay-remove-all)))
(use-package iedit)

(use-package wrap-region
  :init (progn
          (wrap-region-global-mode +1)
          (wrap-region-add-wrapper "`" "`")
          (wrap-region-add-wrapper "{" "}")))

(use-package expand-region
  :defer t
  :bind ("M-2" . er/expand-region))

(use-package hierarchy)
(use-package json-navigator)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t p") 'transpose-params)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t w") 'transpose-words)

(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(global-set-key (kbd "M-z") 'undo)

(use-package avy :bind (("C-:" . avy-goto-char)))
(use-package ibuffer-vc
  :init (add-hook 'ibuffer-hook
                  (lambda ()
                    (ibuffer-vc-set-filter-groups-by-vc-root)
                    (unless (eq ibuffer-sorting-mode 'alphabetic)
                      (ibuffer-do-sort-by-alphabetic)))))

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "<f5>") 'bookmark-jump)

(use-package yaml-mode)
(use-package jekyll-modes)
(add-hook 'jekyll-mode-hook 'highlight-indentation-current-column-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . jekyll-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.liquid" . jekyll-html-mode))

(use-package smart-shift
  :init (global-smart-shift-mode 1))

(use-package highlight-indentation
  :init (progn
          (set-face-background 'highlight-indentation-current-column-face (face-attribute 'region :background))
          (add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)))

(global-set-key (kbd "<s-right>") 'windmove-right)
(global-set-key (kbd "<s-left>") 'windmove-left)
(global-set-key (kbd "<s-up>") 'windmove-up)
(global-set-key (kbd "<s-down>") 'windmove-down)

(defun system-is-imac ()
  (interactive)
  (string-equal (system-name) "iMac-Ignacy.local"))

(defadvice load-theme
    (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))

;; (use-package challenger-deep-theme)
;; (load-theme 'challenger-deep t)
;; (use-package hemera-theme
;;   :init (load-theme 'hemera t))

;;(load-theme 'spacemacs-dark t)
;; (use-package github-modern-theme
;;    :init (load-theme 'github-modern t))
;;(load-theme 'awemacs t)

;; (use-package sexy-monochrome-theme
;;   :init (load-theme 'sexy-monochrome t))

(use-package kaolin-themes
  :init (load-theme 'kaolin-galaxy t))
;;(load-theme 'sanityinc-tomorrow-day t)

(if (system-is-imac)
    (set-frame-font "Hack 17")
  (set-frame-font "Hack 14"))

;; Local Variables:
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:
