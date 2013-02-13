;; interactive name completion for describe-function, describe-variable, etc.
(icomplete-mode 1)

(eval-after-load 'hippie-exp
  '(progn
     (dolist (f '(try-expand-line try-expand-list try-complete-file-name-partially))
       (delete f hippie-expand-try-functions-list))

     ;; Add this back in at the end of the list.
     (add-to-list 'hippie-expand-try-functions-list 'try-complete-file-name-partially t)))


(add-to-list 'load-path "~/.emacs.d/auto-complete-mode")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-mode/ac-dict")
(ac-config-default)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(setq rsense-home "/Users/imoryc/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)


(provide 'init-completition)
