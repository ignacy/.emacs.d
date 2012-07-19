(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory (concat dotfiles-dir "/snippets"))
(yas/load-directory yas/root-directory)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.6.1/snippets")
(setq yas/trigger-key "TAB")


(provide 'init-yasnippet)
