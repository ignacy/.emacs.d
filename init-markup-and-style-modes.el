
(require 'rainbow-mode)
(rainbow-mode)


(require 'haml-mode)

(require 'markdown-mode)

(add-to-list 'load-path (concat dotfiles-dir "/coffee-mode"))
(require 'coffee-mode)

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



(provide 'init-markup-and-style-modes)
