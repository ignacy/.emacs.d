;; interactive name completion for describe-function, describe-variable, etc.
(icomplete-mode 1)

(autoload 'global-company-mode "company" t)
(global-company-mode)

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

;;(global-set-key [tab] 'tab-indent-or-complete)
(setq company-begin-commands '(self-insert-command))
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 4)

(yas-global-mode 1)


;; (setq rsense-home "/Users/imoryc/bin/rsense-0.3")
;; (add-to-list 'load-path (concat rsense-home "/etc"))
;; (require 'rsense)
(provide 'init-completition)
