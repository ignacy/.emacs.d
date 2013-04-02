;; interactive name completion for describe-function, describe-variable, etc.
(icomplete-mode 1)

(add-to-list 'load-path "~/.emacs.d/auto-complete-mode")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-mode/ac-dict")
(ac-config-default)


(setq completion-cycle-threshold 5)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(setq rsense-home "/Users/imoryc/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)


(provide 'init-completition)
