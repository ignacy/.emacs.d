(require 'cl)

;;(setq debug-on-error t)

(defvar set-line-highlighting t)
(defvar set-java-paths-on-windows t)
(defvar set-working-on-bdj t)
(defvar set-indent-before-saving t)
(defvar use-rsense t)
(defvar on-windows (eq system-type 'windows-nt))
(defvar use-recentf-mode t)

(setq dotfiles-dir "~/.emacs.d")
(setq imoryc-dir (concat dotfiles-dir "/imoryc"))
(add-to-list 'load-path imoryc-dir)
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat imoryc-dir "/themes"))
(add-to-list 'load-path (concat dotfiles-dir "/site-lisp/mark-multiple"))

(require 'init-packages)
(require 'im-basic-settings)

(ignore-errors
  (require 'color-theme-sanityinc-tomorrow)
  (color-theme-sanityinc-tomorrow-blue))
;;(load-file (concat imoryc-dir "/themes/color-theme-molokai.el"))
;;(load-file (concat imoryc-dir "/themes/afterthought-theme.el")))
;;  (color-theme-molokai))

(require 'ruby-end)
(require 'init-yasnippet)

;; (require 'autopair)
;; (autopair-global-mode)
;;(push '(font-backend xft x) default-frame-alist)

(require 'find-file-in-tags)
(global-set-key (read-kbd-macro "C-,") 'find-file-in-tags)

(require 'ido)
(ido-mode 'both)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'rainbow-mode)
(rainbow-mode)

(require 'rinari)
(setq rinari-tags-file-name "TAGS")

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; (load-file (concat imoryc-dir "/java-setup.el"))


(require 'epa)
(epa-file-enable)

(require 'haml-mode)

(require 'markdown-mode)

(add-to-list 'load-path (concat dotfiles-dir "/coffee-mode"))
(require 'coffee-mode)

(require 'textmate)
(textmate-mode)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(require 'uniquify)

(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator "@")

(load-file (concat imoryc-dir "/rake-setup.el"))
(load-file (concat imoryc-dir "/project-top.el"))
(load-file (concat imoryc-dir "/compile-mode-options.el"))
(load-file (concat imoryc-dir "/window-manage.el"))
(load-file (concat imoryc-dir "/enhanced_toggle.el"))
(load-file (concat imoryc-dir "/testing.el"))
(load-file (concat imoryc-dir "/testowanie.el"))
;;(require 'matlab)

(require 'magit)
(require 'android-mode)

(when use-rsense
  (setq rsense-home "~/bin/rsense-0.3")
  (add-to-list 'load-path (concat rsense-home "/etc"))
  (require 'rsense))

(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)


(require 'init-autocomplete)
(require 'init-org-mode)

(setq inferior-lisp-program "lein repl")
(add-hook 'sldb-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate )))

(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (setq autopair-dont-activate t)))


(require 'ace-jump-mode)
(define-key global-map (kbd "C-§") 'ace-jump-mode)

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

(require 'yaml-mode)
(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(require 'init-ruby-mode)

(when set-line-highlighting
  (global-hl-line-mode 1)
  ;;(set-face-background 'hl-line "light cyan")
  (set-face-background 'hl-line "#444")
  (set-face-foreground 'highlight nil)
  (set-face-foreground 'hl-line nil)
  (set-face-attribute hl-line-face nil :overline nil)
  (set-face-attribute hl-line-face nil :underline nil))


(setq path-to-ctags "/usr/local/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name))))
;; ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor

(setq x-select-enable-clipboard t)

(defvar compile-command "rake ") ; set the default make command



(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))
(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

;; IBUFFER Settings
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-formats '((mark modified read-only " "
                              (name 30 30 :left :elide)
                              " " filename-and-process)))

(setq ibuffer-use-header-line t)
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("TERMINAL" (name . "^\\*terminal\\*$"))
               ("middleware" (filename . "/code/middleware/"))
               ("fyre" (filename . "/code/webapp/"))
               ("ruby" (mode . ruby-mode))
               ("javascript" (name . "\\.js.erb$\\|.js$"))
               ("ogórki" (name . "\\.feature\$"))
               ("dired" (mode . dired-mode))
               ("Org" (mode . org-mode))
               ("haml" (mode . haml-mode))
               ("elisp" (name . "\\.el\$"))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
  (save-excursion
    (set-buffer "*Ibuffer*")
    (toggle-read-only 0)
    (goto-char 1)
    (search-forward "-\n" nil t)
    (delete-region 1 (point))
    (let ((window-min-height 1))
      ;; save a little screen estate
      (shrink-window-if-larger-than-buffer))
    (toggle-read-only)))

;; install wmctrl (sudo apt-get install wmctrl)
(defun switch-full-screen ()
  "Switch emacs to full screen mode"
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))

(lambda ()
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string
             (regexp-quote isearch-string)))))

(setq frame-title-format
      (list '("emacs ")
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
(setq cursor-in-non-selected-windows nil)


(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))



(when use-recentf-mode
  (setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
  ;; enable recent files mode.
  (require 'recentf)
  (recentf-mode t)
  (setq recentf-max-saved-items 500)
  (add-to-list 'recentf-exclude "\\.revive\\'")

  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting"))))

(defalias 'qrr 'query-replace-regexp)

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.java\" | etags -l java -" dir-name)))
;;p find . -name "*.cpp" -print -or -name "*.h" -print | xargs etags
(setq tags-revert-without-query t)

(defun im/set-fonts ()
  (interactive)
  (condition-case nil
      ;; -apple-Menelo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1
      (set-frame-font "Menlo-14")
    (error nil)))
(im/set-fonts)

(setq auto-save-default nil)

;; Diff/git addons
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red")))))
(setq redisplay-dont-pause t)

;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

;; load key-bindings
(load-file (concat imoryc-dir "/im-helpers.el"))
(load-file (concat imoryc-dir "/im-keys.el"))
(load-file (concat imoryc-dir "/im-abbrevs.el"))

(require 'init-shell-mode)

(defadvice switch-to-buffer (before existing-buffer
                                    activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg)))))


;; (define-clojure-indent
;;   (defroutes 'defun)
;;   (GET 2)
;;   (POST 2)
;;   (PUT 2)
;;   (DELETE 2)
;;   (HEAD 2)
;;   (ANY 2)
;;   (context 2))

(ns-toggle-fullscreen)
