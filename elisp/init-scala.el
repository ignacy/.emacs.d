(use-package scala-mode2
  :init (progn
          (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
          (add-to-list 'load-path "~/.emacs.d/ensime/elisp/")))

;; (require 'flymake)
;; (add-hook 'scala-mode2-hook 'flymake-mode-on)
(use-package sbt-mode)

(provide 'init-scala)
