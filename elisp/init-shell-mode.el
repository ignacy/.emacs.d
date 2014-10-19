(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)


;; make a face
(make-face 'font-lock-small-face)
(set-face-attribute 'font-lock-small-face nil :height 0.9)

(add-hook 'shell-mode-hook
          '(lambda ()
             (setq ansi-color-names-vector ; better contrast colors
                   ["black" "red4" "green4" "yellow4"
                    "blue3" "magenta4" "cyan4" "white"])
             (setq show-trailing-whitespace nil)
             (make-local-variable 'global-hl-line-mode)
             (setq global-hl-line-mode nil)
             (toggle-truncate-lines 1)
             (ansi-color-for-comint-mode-on)
             (set-face-foreground 'highlight nil)
             (font-lock-mode t)
             ;;(buffer-face-mode t) ; only in emacs 23
             ;;(buffer-face-set 'font-lock-small-face)
             (hl-line-mode nil)))

;;(setq comint-prompt-read-only t)
(setq comint-process-echoes t)

(setq explicit-shell-file-name "/bin/zsh")

(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(ansi-color-for-comint-mode-on)

;; term
(defface term-color-black
  '((t (:foreground "#3f3f3f" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-red
  '((t (:foreground "#cc9393" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-green
  '((t (:foreground "#7f9f7f" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-yellow
  '((t (:foreground "#f0dfaf" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-blue
  '((t (:foreground "#6d85ba" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-magenta
  '((t (:foreground "#dc8cc3" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-cyan
  '((t (:foreground "#93e0e3" :background "#272822")))
  "Unhelpful docstring.")
(defface term-color-white
  '((t (:foreground "#dcdccc" :background "#272822")))
  "Unhelpful docstring.")
'(term-default-fg-color ((t (:inherit term-color-white))))
'(term-default-bg-color ((t (:inherit term-color-black))))

;; ansi-term colors
(setq ansi-term-color-vector
      [term term-color-black term-color-red term-color-green term-color-yellow
            term-color-blue term-color-magenta term-color-cyan term-color-white])


(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (setq term-buffer-maximum-size 10000)
            (setq show-trailing-whitespace nil)
            (yas-minor-mode -1)
            (set (make-local-variable 'company-mode) nil)
            (set (make-local-variable 'transient-mark-mode) nil)
            (set (make-local-variable 'smartparens-mode) nil)
            (set (make-local-variable 'global-hl-line-mode) nil)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(defcustom term-bind-key-alist
  '(
    ("C-c C-c" . term-interrupt-subjob)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ("C-r" . isearch-backward)
    ("C-m" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-input)
    ("C-/" . comint-dynamic-complete))
  "The key alist that will need to be bind.
If you do not like default setup, modify it, with (KEY . COMMAND) format."
  :type 'alist
  :group 'multi-term)

;; (defadvice ansi-term (after advise-ansi-term-coding-system)
;;     (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
;; (ad-activate 'ansi-term)

;; shell-mode
(defun sh (&optional name)
  (interactive)
  (shell name))

(defun run-shell (shell-buffer-name)
  "Runs shell in a buffer named shell-buffer-name"
  (interactive "sEnter new shell buffer name: ")
  (shell shell-buffer-name))

(defun zsh ()
  (interactive)
  (shell "zsh"))

(defun switch-to-zsh ()
  (interactive)
  (switch-to-buffer "zsh"))

(defun sh (&optional name)
   (interactive)
   (ansi-term name))


(use-package sane-term
  :init (progn
          (setq sane-term-shell-command "/bin/zsh")
          (global-set-key (kbd "C-x t") 'sane-term)
          (global-set-key (kbd "C-x T") 'sane-term-create)))


;; (defun zsh ()
;;   (interactive)
;;   (multi-term))

;; (defun switch-to-zsh ()
;;    (interactive)
;;    (switch-to-buffer "*terminal<1>*"))

(provide 'init-shell-mode)
