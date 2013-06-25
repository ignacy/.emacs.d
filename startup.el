(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(markdown-mode
                      yaml-mode
                      haml-mode
                      autopair
                      textmate
                      exec-path-from-shell
                      ido-hacks
                      smex
                      rspec-mode
                      quickrun
                      key-chord
                      git-gutter
                      rainbow-mode
                      coffee-mode
                      js2-mode
                      expand-region
                      clojure-mode
                      multiple-cursors
                      magit
                      mark-multiple
                      projectile
                      ruby-mode
                      inf-ruby
                      browse-kill-ring
                      paredit
                      gist
                      yasnippet
                      rainbow-delimiters
                      idle-highlight-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))


;;;; path
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "FORTIS_BACKEND_URL")
(exec-path-from-shell-copy-env "FORTIS_ACCESS_ID")
(exec-path-from-shell-copy-env "FORTIS_ACCESS_KEY")


;;;; emacs server
(ignore-errors (server-start))

;;;; multiple-cursors
(after 'multiple-cursors-autoloads
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
  (global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-<return>") 'mc/mark-more-like-this-extended)
  (global-set-key (kbd "C-S-SPC") 'set-rectangular-region-anchor)
  (global-set-key (kbd "C-M-=") 'mc/insert-numbers)
  (global-set-key (kbd "C-*") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click))

;;;; rainbow-delimeters
(after 'rainbow-delimiters-autoloads
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode-enable))


;;;; global keybindings
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "C-x C-i") 'imenu)

(global-set-key (kbd "C-.") 'repeat)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-M-/") 'hippie-expand-line)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-o") 'open-line-indent)
(global-set-key (kbd "M-o") 'open-previous-line)


;;;; faces
(make-face 'font-lock-number-face)
(set-face-attribute 'font-lock-number-face nil :inherit font-lock-constant-face)
(setq font-lock-number-face 'font-lock-number-face)
(defvar font-lock-number "[0-9-.]+\\([eE][+-]?[0-9]*\\)?")
(defvar font-lock-hexnumber "0[xX][0-9a-fA-F]+")
(defun add-font-lock-numbers (mode)
  (font-lock-add-keywords
   mode
   `((,(concat "\\<\\(" font-lock-number "\\)\\>" ) 0 font-lock-number-face)
     (,(concat "\\<\\(" font-lock-hexnumber "\\)\\>" ) 0 font-lock-number-face)
     )))



;;;; elisp
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)

(font-lock-add-keywords
 'emacs-lisp-mode
 '(("'\\([0-9a-zA-Z-]*\\)" (1 'font-lock-variable-name-face))))
(add-font-lock-numbers 'emacs-lisp-mode)

;;;; exec-path-from-shell
(after 'exec-path-from-shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))


;;;; browse-kill-ring
(after 'browse-kill-ring-autoloads
  (global-set-key (kbd "C-x C-y") 'browse-kill-ring))


;;;; change inner
(after 'change-inner-autoloads
  (global-set-key (kbd "M-i") 'change-inner)
  (global-set-key (kbd "M-o") 'change-outer))


;;;; jump-char
(after 'jump-char-autoloads
  (global-set-key (kbd "M-m") 'jump-char-forward)
  (global-set-key (kbd "M-M") 'jump-char-backward))

(after 'jump-char
  (setq jump-char-lazy-highlight-face nil))


;;;; git-gutter
(after 'git-gutter-autoloads
  (global-git-gutter-mode t))

;;;; idle-highlight
(after 'idle-highlight-mode-autoloads
  (defun idle-coding-hook ()
    (idle-highlight-mode t))

  (defun set-javascript()
    (setq autopair-mode nil))

  (add-hook 'emacs-lisp-mode-hook 'idle-coding-hook)
  (add-hook 'clojure-mode-hook 'idle-coding-hook)
  (add-hook 'ruby-mode-hook 'idle-coding-hook)
  (add-hook 'js2-mode-hook 'idle-coding-hook)
  (add-hook 'js2-mode-hook 'set-javascript)
  (add-hook 'matlab-mode-hook 'idle-coding-hook)
  (add-hook 'rhtml-mode-hook 'idle-coding-hook)
  (add-hook 'java-mode-hook 'idle-coding-hook))

;;;; various
(after 'textmate-autoloads
  (textmate-mode))

(after 'inline-string-rectangle-autoloads
  (global-set-key (kbd "C-x r t") 'inline-string-rectangle))

(after 'quickrun-autoloads
  (require 'quickrun))

(after 'paren
  (set-face-background 'show-paren-match-face (face-background 'default))
  (set-face-foreground 'show-paren-match-face "red")
  (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)
  (set-default 'imenu-auto-rescan t))
(require 'paren)

(after 'uniquify
  (setq
   uniquify-buffer-name-style 'post-forward
   uniquify-separator "@")
  (setq frame-title-format
        (list '("emacs ")
              '(buffer-file-name "%f" (dired-directory dired-directory "%b")))))
(require 'uniquify)

;; (after 'magit
;;   (set-face-background 'magit-item-highlight "#121212")
;;   (set-face-foreground 'diff-context "#666666")
;;   (set-face-foreground 'diff-added "#00cc33")
;;   (set-face-foreground 'diff-removed "#ff0000"))


;;;; IDO-MODE
;; Display ido results vertically, rather than horizontally
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(add-to-list 'ido-ignore-files "\\.DS_Store")

(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;;; sort ido filelist by mtime instead of alphabetically
(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
(defun ido-sort-mtime ()
  (setq ido-temp-list
        (sort ido-temp-list
              (lambda (a b)
                (time-less-p
                 (sixth (file-attributes (concat ido-current-directory b)))
                 (sixth (file-attributes (concat ido-current-directory a)))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
              (lambda (x) (and (char-equal (string-to-char x) ?.) x))
              ido-temp-list))))

(require 'ido-hacks)
(ido-hacks-mode)

(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)


;;;; smex
(after 'smex-autoloads
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))


(provide 'startup)
