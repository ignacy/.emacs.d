;; interactive name completion for describe-function, describe-variable, etc.
(icomplete-mode 1)

(setq rsense-home "/Users/imoryc/bin/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(provide 'init-completition)
