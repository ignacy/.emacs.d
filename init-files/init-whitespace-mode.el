(require 'whitespace)
(setq-default whitespace-style '(face trailing lines-tail indentation::space))
(setq-default whitespace-line-column 80)
(global-whitespace-mode 1)


(provide 'init-whitespace-mode)
